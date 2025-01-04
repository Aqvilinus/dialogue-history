module DialogueHistory.UI

import Codeware.UI.*
import DialogueHistory.Core.Day

public class Button extends SimpleButton {
  protected let m_day: wref<Day>;
  protected let m_reference: wref<Sidebar>;
  protected let m_state: ButtonState = ButtonState.Normal;

  protected let FRAME_NORMAL_OPACITY: Float = 0.008;
  protected let FRAME_HOVER_OPACITY: Float = 0.10;
  protected let FRAME_ACTIVE_OPACITY: Float = 1.0;

  protected let FILL_NORMAL_OPACITY: Float = 0.0;
  protected let FILL_HOVER_OPACITY: Float = 0.006;
  protected let FILL_ACTIVE_OPACITY: Float = 0.012;

  protected func CreateWidgets() {
    let root: ref<inkCanvas> = new inkCanvas();
    root.SetName(n"button");
    root.SetSize(400.0, 100.0);
    root.SetAnchorPoint(new Vector2(0.5, 0.5));
    root.SetInteractive(true);

    let bg: ref<inkImage> = new inkImage();
    bg.SetName(n"bg");
    bg.SetAtlasResource(r"base\\gameplay\\gui\\common\\shapes\\atlas_shapes_sync.inkatlas");
    bg.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    bg.BindProperty(n"tintColor", n"MainColors.Fullscreen_PrimaryBackgroundDarkest");
    bg.SetOpacity(0.0);
    bg.SetAnchor(inkEAnchor.Fill);
    bg.SetNineSliceScale(true);
    bg.SetNineSliceGrid(new inkMargin(0.0, 0.0, 10.0, 0.0));
    bg.Reparent(root);

    let fill: ref<inkImage> = new inkImage();
    fill.SetName(n"fill");
    fill.SetAtlasResource(r"base\\gameplay\\gui\\common\\shapes\\atlas_shapes_sync.inkatlas");
    fill.SetOpacity(this.FILL_NORMAL_OPACITY);
    fill.SetAnchor(inkEAnchor.Fill);
    fill.SetTintColor(new HDRColor(1.176, 0.381, 0.348, 1.000));
    fill.SetNineSliceScale(true);
    fill.SetNineSliceGrid(new inkMargin(0.0, 0.0, 10.0, 0.0));
    fill.Reparent(root);

    let frame: ref<inkImage> = new inkImage();
    frame.SetName(n"frame");
    frame.SetAtlasResource(r"base\\gameplay\\gui\\common\\shapes\\atlas_shapes_sync.inkatlas");
    frame.SetOpacity(this.FRAME_NORMAL_OPACITY);
    frame.SetAnchor(inkEAnchor.Fill);
    frame.SetTintColor(new HDRColor(1.176, 0.381, 0.348, 1.000));
    frame.SetNineSliceScale(true);
    frame.SetNineSliceGrid(new inkMargin(0.0, 0.0, 10.0, 0.0));
    frame.Reparent(root);

    let label: ref<inkText> = new inkText();
    label.SetName(n"label");
    label.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
    label.SetFontStyle(n"Medium");
    label.SetFontSize(50);
    label.SetLetterCase(textLetterCase.UpperCase);
    label.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    label.BindProperty(n"tintColor", n"MainColors.White");
    label.SetAnchor(inkEAnchor.Fill);
    label.SetHorizontalAlignment(textHorizontalAlignment.Center);
    label.SetVerticalAlignment(textVerticalAlignment.Center);
    label.SetText("BUTTON");
    label.Reparent(root);

    this.m_root = root;
    this.m_label = label;
    this.m_bg = bg;
    this.m_fill = fill;
    this.m_frame = frame;

    this.SetRootWidget(root);
    this.ApplyFlippedState();
  }

  public func SetFontSize(size: Int32) -> Void {
    this.m_label.SetFontSize(size);
  }

  protected func ApplyPressedState() {
    if this.m_isPressed {
      this.m_reference.OnButtonPress(this);
    } 
  }

  protected func ApplyHoveredState() {
    if this.m_isHovered {
      this.m_reference.OnButtonHoverOver(this);
    } else {
      this.m_reference.OnButtonHoverOut(this);
    }
  }

  protected func SetDay(day: wref<Day>) -> Void {
    this.m_day = day;
  }

  public func GetDay() -> wref<Day> {
    return this.m_day;
  }

  public func SetState(state: ButtonState) -> Void {
    if Equals(this.m_state, state) {
      return;
    }

    let isNone: Bool = Equals(state, ButtonState.Normal);
    let isHovering: Bool = Equals(state, ButtonState.Hover);
    let isActive: Bool = Equals(state, ButtonState.Active);

    if isNone {
      this.m_fill.SetOpacity(this.FILL_NORMAL_OPACITY);
      this.m_frame.SetOpacity(this.FRAME_NORMAL_OPACITY);
    } else if isHovering {
      this.m_fill.SetOpacity(this.FILL_HOVER_OPACITY);
      this.m_frame.SetOpacity(this.FRAME_HOVER_OPACITY);
    } else if isActive {
      this.m_fill.SetOpacity(this.FILL_ACTIVE_OPACITY);
      this.m_frame.SetOpacity(this.FRAME_ACTIVE_OPACITY);
    }

    this.m_state = state;
  }

  public func Is(state: ButtonState) -> Bool {
    return Equals(this.m_state, state);
  }

  public func SetReference(reference: wref<Sidebar>) -> Void {
    this.m_reference = reference;
  }

  public static func Create(day: wref<Day>) -> ref<Button> {
    let self = new Button();
    self.CreateInstance();
    self.SetDay(day);

    return self;
  }
}

public enum ButtonState {
  Normal = 0,
  Hover = 1,
  Active = 2,
}