module DialogueHistory.UI

import DialogueHistory.Events.{LogEvent, RefreshLogEvent}
import DialogueHistory.Core.{Day, History}
import Codeware.UI.*

public class Sidebar extends Practice {
  protected let m_root: wref<inkCanvas>;
  protected let m_textContainer: wref<inkVerticalPanel>;
  protected let m_button: wref<Button>;

  protected cb func OnCreate() -> Void {
    let root = new inkCanvas();
    root.SetName(this.GetClassName());
    root.SetAnchor(inkEAnchor.LeftFillVerticaly);
    root.SetSize(this.GetPadding(), 0.0);
    root.SetFitToContent(false);

    let scrollArea = new inkScrollArea();
    scrollArea.SetName(n"ScrollArea");
    scrollArea.SetAnchor(inkEAnchor.Fill);
    scrollArea.SetMargin(30.0, 30.0, 30.0, 30.0);
    scrollArea.SetInteractive(true);
    scrollArea.Reparent(root);

    let textContainer = new inkVerticalPanel();
    textContainer.SetName(n"TextContainer");
    textContainer.SetAnchor(inkEAnchor.TopLeft);
    textContainer.SetChildMargin(new inkMargin(0.0, 20.0, 0.0, 0.0));
    textContainer.SetFitToContent(true);
    textContainer.SetChildOrder(inkEChildOrder.Backward);
    textContainer.Reparent(scrollArea);

    let sliderArea = new inkCanvas();
    sliderArea.SetName(n"SliderArea");
    sliderArea.SetAnchor(inkEAnchor.RightFillVerticaly);
    sliderArea.SetInteractive(true);
    sliderArea.SetWidth(10.0);
    sliderArea.SetMargin(30.0, 30.0, 30.0, 60.0);
    sliderArea.Reparent(root);

    let sliderFill = new inkRectangle();
    sliderFill.SetName(n"Fill");
    sliderFill.SetAnchor(inkEAnchor.Fill);
    sliderFill.SetOpacity(0.5);
    sliderFill.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    sliderFill.BindProperty(n"tintColor", n"MainColors.DarkRed");
    sliderFill.Reparent(sliderArea);

    let sliderHandle = new inkRectangle();
    sliderHandle.SetName(n"Handle");
    sliderHandle.SetAnchor(inkEAnchor.TopFillHorizontaly);
    sliderHandle.SetSize(10.0, 70.0);
    sliderHandle.SetInteractive(true);
    sliderHandle.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    sliderHandle.BindProperty(n"tintColor", n"MainColors.Red");
    sliderHandle.Reparent(sliderArea);

    let sliderController = new inkSliderController();
    sliderController.slidingAreaRef = inkScrollAreaRef.Create(sliderArea);
    sliderController.handleRef = inkWidgetRef.Create(sliderHandle);
    sliderController.direction = inkESliderDirection.Vertical;
    sliderController.autoSizeHandle = true;
    sliderController.percentHandleSize = 0.4;
    sliderController.minHandleSize = 40.0;
    sliderController.Setup(0.0, 1.0, 0.0);
    sliderArea.AttachController(sliderController);

    let scrollController = new inkScrollController();
    scrollController.ScrollArea = inkScrollAreaRef.Create(scrollArea);
    scrollController.VerticalScrollBarRef = inkWidgetRef.Create(sliderArea);
    scrollController.autoHideVertical = true;
    scrollController.SetScrollPosition(0.0);
    root.AttachController(scrollController);

    this.m_root = root;
    this.m_textContainer = textContainer;

    this.SetRootWidget(root);
  }

  protected cb func OnInitialize() -> Void {
    this.Draw();

    GameInstance.GetCallbackSystem().RegisterCallback(n"DialogueHistory.Events.RefreshLogEvent", this, n"OnRefreshLog");
  }

  protected cb func OnUninitialize() -> Void {
    super.OnUninitialize();

    GameInstance.GetCallbackSystem().UnregisterCallback(n"DialogueHistory.Events.RefreshLogEvent", this, n"OnRefreshLog");
  }

  private cb func OnRefreshLog(event: ref<RefreshLogEvent>) -> Void {
    this.Reset();
    this.Draw();
  }

  private func Reset() -> Void {
    this.m_textContainer.RemoveAllChildren();
    this.m_button = null;
    GameInstance.GetCallbackSystem().DispatchEvent(LogEvent.Create(null));
  }

  private func Draw() -> Void {
    let history = this.GetHistory();
    
    if !IsDefined(history) || history.GetSize() == 0 {
      let button = Button.Create(null);
      button.SetName(n"Empty");
      button.SetText(this.GetLocalizedText("DialogueHistory-UI-Category-Empty"));
      button.SetFontSize(40);
      button.ToggleSounds(true);
      button.ToggleAnimations(true);
      button.SetReference(this);
      button.SetDisabled(true);
      button.Reparent(this.m_textContainer);

      return;
    }

    let days = history.GetDays();
    let size = ArraySize(days);
    let i = 0;

    while i < size {
      let day = days[i];

      let isToday: Bool = day.IsToday();
      let number: Int32 = day.GetNumber();
      let name: String = isToday ? this.GetLocalizedText("DialogueHistory-UI-Category-Today") : StrReplace(this.GetLocalizedText("DialogueHistory-UI-Category-Day"), "{num}", IntToString(number));

      let button = Button.Create(day);
      button.SetName(StringToName(name));
      button.SetText(name);
      button.SetFontSize(40);
      button.ToggleSounds(true);
      button.ToggleAnimations(true);
      button.SetReference(this);
      button.Reparent(this.m_textContainer);
      button.RegisterToCallback(n"OnRelease", this, n"OnRelease");

      if i == (size - 1) {
        this.Activate(button);
      }

      i += 1;
    }
  }
  
  private func Activate(ref: ref<Button>) -> Void {
    ref.SetState(ButtonState.Active);
    this.m_button = ref;

    GameInstance.GetCallbackSystem().DispatchEvent(LogEvent.Create(ref.GetDay()));
  }
  
	protected cb func OnRelease(evt: ref<inkPointerEvent>) -> Bool {
    let button = evt.GetTarget().GetController() as Button;

		if evt.IsAction(n"popup_moveUp") {
      let day = button.GetDay();

      if !day.IsToday() {
        DeleteDayPrompt.Show(this.GetGameController(), day);
      } else if !day.IsEmpty() {
        ClearDayPrompt.Show(this.GetGameController(), day);
      }
		}
	}

  private func Deactive(state: ButtonState) -> Void {
    this.m_button.SetState(state);
    this.m_button = null;

    GameInstance.GetCallbackSystem().DispatchEvent(LogEvent.Create(null));
  }

  public func OnButtonPress(ref: ref<Button>) -> Void {
    if IsDefined(this.m_button) && !(this.m_button == ref) {
      this.Deactive(ButtonState.Normal);
    }

    if ref.Is(ButtonState.Active) {
      this.Deactive(ref.m_isHovered ? ButtonState.Hover : ButtonState.Normal);
    } else {
      this.Activate(ref);
    }

    this.UpdateHint(n"click", ref.Is(ButtonState.Active) ? GetLocalizedText("LocKey#77898") : GetLocalizedText("LocKey#17834"));
    this.PlaySound(n"Button", n"OnPress");
  }

  public func OnButtonHoverOver(ref: ref<Button>) -> Void {
    if !ref.Is(ButtonState.Active) {
      ref.SetState(ButtonState.Hover);
    }

    let day = ref.GetDay();

    if !day.IsToday() {
      this.UpdateHint(n"popup_moveUp", GetLocalizedText("LocKey#96209"));
    } else if !day.IsEmpty() {
      this.UpdateHint(n"popup_moveUp", GetLocalizedText("LocKey#283"));
    }

    if ref.Is(ButtonState.Active) {
      this.UpdateHint(n"click", GetLocalizedText("LocKey#77898"));
    } else {
      this.UpdateHint(n"click", GetLocalizedText("LocKey#17834"));
    }

    this.PlaySound(n"Button", n"OnHover");
  }

  public func OnButtonHoverOut(ref: ref<Button>) -> Void {
    if !ref.Is(ButtonState.Active) {
      ref.SetState(ButtonState.Normal);
    }

    this.RemoveHint(n"click");
    this.RemoveHint(n"popup_moveUp");
  }
}