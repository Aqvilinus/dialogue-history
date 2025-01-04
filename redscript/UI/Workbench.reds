module DialogueHistory.UI

import DialogueHistory.Core.{Config, History}
import Codeware.Localization.{LocalizationSystem}
import Codeware.UI.{ButtonHintsEx, inkCustomController}
import DialogueHistory.Utils.GetColorClassName

public class Workbench extends inkCustomController {
  protected let m_root: wref<inkFlex>;
  protected let m_container: wref<inkCanvas>;
  protected let m_buttonHints: wref<ButtonHintsEx>;
  protected let m_translator: wref<LocalizationSystem>;
  protected let m_config: wref<Config>;
  protected let m_history: wref<History>;

  protected let m_padding: Float;
  protected let m_areaSize: Vector2;

  protected cb func OnCreate() {
    let workbench = new inkFlex();
    workbench.SetName(n"Workbench");
    workbench.SetAnchor(inkEAnchor.Fill);

    let background = new inkImage();
    background.SetName(n"Background");
    background.SetAnchor(inkEAnchor.Fill);
    background.SetAtlasResource(r"base\\gameplay\\gui\\common\\shapes\\atlas_shapes_sync.inkatlas");
    background.SetTexturePart(n"unified_tooltip_fill");
    background.SetNineSliceScale(true);
    background.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    background.BindProperty(n"tintColor", n"MainColors.Fullscreen_PrimaryBackgroundDarkest");
    background.SetOpacity(0.610);
    background.Reparent(workbench);

    let frame = new inkImage();
    frame.SetName(n"Frame");
    frame.SetAnchor(inkEAnchor.Fill);
    frame.SetAtlasResource(r"base\\gameplay\\gui\\common\\shapes\\atlas_shapes_sync.inkatlas");
    frame.SetTexturePart(n"unified_tooltip_stroke");
    frame.SetNineSliceScale(true);
    frame.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    frame.BindProperty(n"tintColor", GetColorClassName(this.m_config.frameColor));
    frame.SetOpacity(0.61);
    frame.Reparent(workbench);

    let container = new inkCanvas();
    container.SetName(n"Container");
    container.SetAnchor(inkEAnchor.Fill);
    container.Reparent(workbench);

    this.m_root = workbench;
    this.m_container = container;

    this.SetRootWidget(workbench);
    this.SetContainerWidget(container);
  }

  public func GetContainer() -> wref<inkCanvas> {
    return this.m_container;
  }

  public func GetHints() -> wref<ButtonHintsEx> {
    return this.m_buttonHints;
  }

  public func GetTranslator() -> wref<LocalizationSystem> {
    return this.m_translator;
  }

  public func GetHistory() -> wref<History> {
    return this.m_history;
  }

  public func GetConfig() -> wref<Config> {
    return this.m_config;
  }

  public func SetConfig(config: wref<Config>) {
    this.m_config = config;
  }

  public func GetSize() -> Vector2 {
    return this.m_areaSize;
  }

  public func SetSize(areaSize: Vector2) -> Void {
    this.m_areaSize = areaSize;
  }

  public func SetPadding(padding: Float) -> Void {
    this.m_padding = padding;
  }

  public func GetPadding() -> Float {
    return this.m_padding;
  }

  public func SetHints(buttonHints: wref<ButtonHintsEx>) -> Void {
    this.m_buttonHints = buttonHints;
  }

  public func SetTranslator(localization: wref<LocalizationSystem>) -> Void {
    this.m_translator = localization;
  }

  public func SetHistory(history: wref<History>) -> Void {
    this.m_history = history;
  }

  public func AddPractice(practice: ref<Practice>) -> Void {
    practice.Assign(this);
  }

  public static func Create(config: wref<Config>) -> ref<Workbench> {
    let self = new Workbench();
    self.SetConfig(config);
    self.CreateInstance();

    return self;
  }
}
