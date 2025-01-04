module DialogueHistory.UI

import DialogueHistory.Core.*
import Codeware.Localization.*
import Codeware.UI.*

public class DialogueHistoryPopup extends InGamePopup {
  protected let m_header: ref<Header>;
  protected let m_footer: ref<Footer>;
  protected let m_content: ref<Content>;
  protected let m_workbench: ref<Workbench>;
  protected let m_translator: ref<LocalizationSystem>;
  protected let m_config: ref<Config>;
  protected let m_history: ref<History>;

  protected func CreateContainer() {
    let container: ref<inkCanvas> = new inkCanvas();
    container.SetName(n"container");
    container.SetMargin(new inkMargin(0.0, 0.0, 0.0, 50.0));
    container.SetAnchor(inkEAnchor.Centered);
    container.SetAnchorPoint(new Vector2(0.5, 0.5));
    container.SetSize(new Vector2(1550.0, 840.0));
    container.Reparent(this.GetRootCompoundWidget());

    this.m_container = container;
    this.SetContainerWidget(container);
  }

  protected cb func OnCreate() {
    super.OnCreate();

    this.m_config = Config.Get();
    this.m_translator = LocalizationSystem.GetInstance(this.GetGame());
    this.m_history = History.Get(this.GetGame());

    this.m_container.SetHeight(this.m_config.popupHeight);
    this.m_container.SetWidth(this.m_config.popupWidth);

    this.m_header = Header.Create();
    this.m_header.SetTitle(this.m_translator.GetText("DialogueHistory-Title"));
    this.m_header.Reparent(this);

    this.m_footer = Footer.Create();
    this.m_footer.Reparent(this);

    this.m_content = Content.Create();
    this.m_content.Reparent(this);

    this.m_workbench = Workbench.Create(this.m_config);
    this.m_workbench.SetSize(this.m_content.GetSize());
    this.m_workbench.SetPadding(500.0);
    this.m_workbench.SetTranslator(this.m_translator);
    this.m_workbench.SetHistory(this.m_history);
    this.m_workbench.Reparent(this.m_content);

    this.m_workbench.AddPractice(new TextArea());
    this.m_workbench.AddPractice(new Sidebar());
  }

  protected cb func OnInitialize() {
    super.OnInitialize();

    this.m_workbench.SetHints(this.m_footer.GetHints());
  }

  public func UseCursor() -> Bool {
    return true;
  }

  public static func Show(requester: ref<inkGameController>) {
    let popup = new DialogueHistoryPopup();
    popup.Open(requester);
  }
}
