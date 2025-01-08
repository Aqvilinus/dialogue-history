module DialogueHistory.UI

import DialogueHistory.Core.{History, Day, Config}
import DialogueHistory.Events.LogEvent

import DialogueHistory.Utils.*

public class TextArea extends Practice {
  protected let m_root: wref<inkCanvas>;
  protected let m_noEntryText: wref<inkText>;
  protected let m_noLinesAvailableText: wref<inkText>;
  protected let m_textContainer: wref<inkVerticalPanel>;
  protected let m_scrollController: wref<inkScrollController>;

  protected cb func OnCreate() -> Void {
    let root = new inkCanvas();
    root.SetName(this.GetClassName());
    root.SetAnchor(inkEAnchor.Fill);
    root.SetMargin(this.GetPadding(), 0, 0, 0);
    root.SetFitToContent(false);

    let noEntrySelectedText = new inkText();
    noEntrySelectedText.SetName(n"NoItemSelectedText");
    noEntrySelectedText.SetAnchor(inkEAnchor.CenterFillHorizontaly);
    noEntrySelectedText.SetText(this.GetLocalizedText("DialogueHistory-UI-Log-None"));
    noEntrySelectedText.SetFontSize(60);
    noEntrySelectedText.SetVisible(true);
    noEntrySelectedText.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
    noEntrySelectedText.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    noEntrySelectedText.BindProperty(n"tintColor", n"MainColors.Red");
    noEntrySelectedText.SetHorizontalAlignment(textHorizontalAlignment.Center);
    noEntrySelectedText.SetVerticalAlignment(textVerticalAlignment.Center);
    noEntrySelectedText.Reparent(root);

    let noLinesAvailableText = new inkText();
    noLinesAvailableText.SetName(n"NoLinesAvailableText");
    noLinesAvailableText.SetAnchor(inkEAnchor.CenterFillHorizontaly);
    noLinesAvailableText.SetText(this.GetLocalizedText("DialogueHistory-UI-Log-Empty"));
    noLinesAvailableText.SetFontSize(60);
    noLinesAvailableText.SetVisible(false);
    noLinesAvailableText.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
    noLinesAvailableText.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    noLinesAvailableText.BindProperty(n"tintColor", n"MainColors.Red");
    noLinesAvailableText.SetHorizontalAlignment(textHorizontalAlignment.Center);
    noLinesAvailableText.SetVerticalAlignment(textVerticalAlignment.Center);
    noLinesAvailableText.Reparent(root);

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
    textContainer.SetVisible(false);
    textContainer.Reparent(scrollArea);

    let sliderArea = new inkCanvas();
    sliderArea.SetName(n"SliderArea");
    sliderArea.SetAnchor(inkEAnchor.RightFillVerticaly);
    sliderArea.SetInteractive(true);
    sliderArea.SetWidth(10.0);
    sliderArea.SetMargin(0, 0, -10.0, 0);
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
    this.m_noEntryText = noEntrySelectedText;
    this.m_noLinesAvailableText = noLinesAvailableText;
    this.m_textContainer = textContainer;
    this.m_scrollController = scrollController;

    this.SetRootWidget(root);
  }

  protected cb func OnInitialize() -> Void {
    super.OnInitialize();

    GameInstance.GetCallbackSystem().RegisterCallback(n"DialogueHistory.Events.LogEvent", this, n"OnLogEvent");
  }

  protected cb func OnUninitialize() -> Void {
    super.OnUninitialize();

    GameInstance.GetCallbackSystem().UnregisterCallback(n"DialogueHistory.Events.LogEvent", this, n"OnLogEvent");
  }

  private cb func OnLogEvent(event: ref<LogEvent>) -> Void {
    this.Update(event.GetDay());
  }

  public final func Update(day: ref<Day>) -> Void {
    let config = this.m_workbench.GetConfig();
    let padding = this.m_workbench.GetPadding();

    this.m_textContainer.SetVisible(false);
    this.m_noEntryText.SetVisible(false);
    this.m_noLinesAvailableText.SetVisible(false);

    this.m_scrollController.SetScrollPosition(1.0);
    this.m_textContainer.RemoveAllChildren();

    if !IsDefined(day) {
      this.m_noEntryText.SetVisible(true);
      return;
    } 

    if day.GetSize() == 0 {
      this.m_noLinesAvailableText.SetVisible(true);
      return;
    }

    let textOffset = config.showTime ? 350.0 : 250.0;
    let wrappingWidth = config.popupWidth - padding - textOffset;

    for line in day.GetLines() {
      let speakerColor: CName;
      let speakerName: String = NameToString(line.speakerName);

      if Equals(speakerName, "V") {
        speakerColor = GetColorClassName(config.vSpeakerColor);
      } else if Equals(line.type, scnDialogLineType.OverHead) || Equals(line.type, scnDialogLineType.OverHeadAlwaysVisible) {
        speakerColor = GetColorClassName(config.overheadColor);
      } else if Equals(line.type, scnDialogLineType.Radio) {
        speakerColor = GetColorClassName(config.radioColor);
      } else if Equals(line.type, scnDialogLineType.GlobalTV) || Equals(line.type, scnDialogLineType.GlobalTVAlwaysVisible) {
        speakerColor = GetColorClassName(config.globalTVColor);
      } else {
        speakerColor = GetColorClassName(config.speakerColor);
      }

      let row = new inkHorizontalPanel();
      row.SetName(n"Row");
      row.SetAnchor(inkEAnchor.TopLeft);
      row.Reparent(this.m_textContainer);

      if config.showTime {
        let formattedTime = Equals(config.timeFormat, TimeFormat.TwentyFourHour) ? FormatTwentyFourHour(line) : FormatTwelveHour(line);

        let time = new inkText();
        time.SetName(n"Time");
        time.SetText(s"\(formattedTime)  ");
        time.SetFontSize(config.fontSize);
        time.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
        time.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
        time.BindProperty(n"tintColor", GetColorClassName(config.timeColor));
        time.Reparent(row);
      }

      let name = new inkText();
      name.SetName(n"Name");
      name.SetText(s"\(this.GetLocalizedText(speakerName)): ");
      name.SetFontSize(config.fontSize);
      name.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
      name.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
      name.BindProperty(n"tintColor", speakerColor);
      name.Reparent(row);

      let text = new inkText();
      text.SetName(n"Line");
      text.SetText(NameToString(line.text));
      text.SetFontSize(config.fontSize);
      text.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
      text.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
      text.BindProperty(n"tintColor", GetColorClassName(config.textColor));
      text.SetWrapping(true, wrappingWidth, textWrappingPolicy.Default);
      text.Reparent(row);
    }

    this.m_textContainer.SetVisible(true);
    
    if config.animatePopup {
      this.ApplyOpeningTransition();
    }
  }

  protected func ApplyOpeningTransition() -> Void {
    let transparencyAnim: ref<inkAnimTransparency> = new inkAnimTransparency();
    transparencyAnim.SetStartTransparency(0.0);
    transparencyAnim.SetEndTransparency(1.0);
    transparencyAnim.SetDuration(0.2);

    let transparencyAnimDef: ref<inkAnimDef> = new inkAnimDef();
    transparencyAnimDef.AddInterpolator(transparencyAnim);

    this.m_textContainer.PlayAnimation(transparencyAnimDef);
  }
}