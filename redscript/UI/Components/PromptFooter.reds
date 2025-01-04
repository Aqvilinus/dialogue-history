module DialogueHistory.UI

import Codeware.UI.InMenuPopupFooter

public class PromptFooter extends InMenuPopupFooter {
  protected cb func OnCreate() {
    let buttons: ref<inkHorizontalPanel> = new inkHorizontalPanel();
    buttons.SetName(n"Buttons");
    buttons.SetFitToContent(true);
    buttons.SetMargin(new inkMargin(0.0, 0.0, 0.0, 0.0));
    buttons.SetHAlign(inkEHorizontalAlign.Right);
    buttons.SetChildMargin(new inkMargin(10.0, 0.0, 0.0, 0.0));

    this.SetRootWidget(buttons);
  }

  public static func Create() -> ref<PromptFooter> {
    let self = new PromptFooter();
    self.CreateInstance();

    return self;
  }
}