module DialogueHistory.UI

import DialogueHistory.Core.{Config, History}
import Codeware.Localization.*
import Codeware.UI.*

public abstract class Practice extends inkCustomController {
  protected let m_name: String;
  protected let m_workbench: wref<Workbench>;
  protected let m_container: wref<inkCanvas>;

  protected cb func OnAssign() {
    let namespace: String;
    StrSplitLast(NameToString(this.GetClassName()), ".", namespace, this.m_name);
  }

  protected cb func OnCreate() {
    let root = new inkCanvas();
    root.SetName(this.GetClassName());
    root.SetAnchor(inkEAnchor.Fill);

    this.SetRootWidget(root);
  }

  protected func GetAreaSize() -> Vector2 {
    return this.m_workbench.GetSize();
  }

  protected func GetPadding() -> Float {
    return this.m_workbench.GetPadding();
  }

  protected func GetLocalizedText(key: String) -> String {
    return this.m_workbench.GetTranslator().GetText(key);
  }

  protected func GetHistory() -> wref<History> {
    return this.m_workbench.GetHistory();
  }

  protected func GetConfig() -> wref<Config> {
    return this.m_workbench.GetConfig();
  }

  protected func UpdateHint(action: CName, label: String, active: Bool) {
    if active {
      this.m_workbench.GetHints().AddButtonHint(action, label);
    } else {
      this.m_workbench.GetHints().RemoveButtonHint(action);
    }
  }

  protected func UpdateHint(action: CName, label: String) {
    this.m_workbench.GetHints().AddButtonHint(action, label);
  }

  protected func UpdateHoldHint(action: CName, label: String, active: Bool) {
    if active {
      this.m_workbench.GetHints().AddButtonHint(action, "[" + GetLocalizedText("LocKey#565") + "] " + label);
    } else {
      this.m_workbench.GetHints().RemoveButtonHint(action);
    }
  }

  protected func UpdateHoldHint(action: CName, label: String) {
    this.m_workbench.GetHints().AddButtonHint(action, "[" + GetLocalizedText("LocKey#565") + "] " + label);
  }

  protected func RemoveHint(action: CName) {
    this.m_workbench.GetHints().RemoveButtonHint(action);
  }

  protected func LockHints() {
    this.m_workbench.GetHints().Lock();
  }

  protected func UnlockHints() {
    this.m_workbench.GetHints().Unlock();
  }

  protected func Trigger(event: CName) {
    this.m_workbench.CallCustomCallback(event);
  }

  public func Assign(workbench: ref<Workbench>) {
    this.m_workbench = workbench;
    this.m_container = this.m_workbench.GetContainer();

    this.OnAssign();

    this.Reparent(this.m_workbench);
  }
}
