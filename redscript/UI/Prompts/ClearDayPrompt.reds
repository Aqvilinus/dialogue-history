module DialogueHistory.UI

import DialogueHistory.Core.Day
import DialogueHistory.Events.RefreshLogEvent
import Codeware.Localization.LocalizationSystem

import Codeware.UI.*

public class ClearDayPrompt extends InMenuPopup {
  private let m_day: wref<Day>;

	protected cb func OnCreate() {
		super.OnCreate();

    let translator = LocalizationSystem.GetInstance(this.GetGame());

		let content = InMenuPopupContent.Create();
		content.SetTitle(translator.GetText("DialogueHistory-UI-Prompt-Clear-Title"));
		content.Reparent(this);

		let text = new inkText();
    text.SetText(translator.GetText("DialogueHistory-UI-Prompt-Clear-Description"));
    text.SetWrapping(true, 700.0);
    text.SetFitToContent(true);
    text.SetFontFamily("base\\gameplay\\gui\\fonts\\raj\\raj.inkfontfamily");
    text.SetStyle(r"base\\gameplay\\gui\\common\\main_colors.inkstyle");
    text.BindProperty(n"tintColor", n"MainColors.Red");
    text.BindProperty(n"fontWeight", n"MainColors.BodyFontWeight");
    text.BindProperty(n"fontSize", n"MainColors.ReadableSmall");
    text.Reparent(content.GetContainerWidget());

		let footer = PromptFooter.Create();
		footer.Reparent(this);

		let confirmBtn = PopupButton.Create();
		confirmBtn.SetText(GetLocalizedText("LocKey#23123"));
		confirmBtn.SetInputAction(n"system_notification_confirm");
		confirmBtn.Reparent(footer);

		let cancelBtn = PopupButton.Create();
		cancelBtn.SetText(GetLocalizedText("LocKey#22175"));
		cancelBtn.SetInputAction(n"back");
		cancelBtn.Reparent(footer);
	}

  protected func SetDay(day: wref<Day>) {
    this.m_day = day;
  }

  protected cb func OnConfirm() -> Void {
    this.m_day.ClearLines();
    GameInstance.GetCallbackSystem().DispatchEvent(RefreshLogEvent.Create());
  }

	public static func Show(requester: ref<inkGameController>, day: wref<Day>) -> ref<ClearDayPrompt> {
		let popup = new ClearDayPrompt();
    popup.SetDay(day);
		popup.Open(requester);

		return popup;
	}
}