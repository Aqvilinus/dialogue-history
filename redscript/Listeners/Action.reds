module DialogueHistory.Listener

import DialogueHistory.Core.Config
import DialogueHistory.Utils.Logger.*
import DialogueHistory.UI.DialogueHistoryPopup
import Codeware.Localization.LocalizationSystem

@wrapMethod(BaseContextEvents)
private final func UpdateHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
  if this.ShouldForceRefreshInputHints(stateContext) {
    this.RemoveDialogueHistoryPopupInputHints(stateContext, scriptInterface);
  }

  wrappedMethod(stateContext, scriptInterface);
}

@addField(InputContextTransitionEvents)
private let m_config: ref<Config>;

@wrapMethod(InputContextTransitionEvents)
protected final func OnAttach(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Void {
  wrappedMethod(stateContext, scriptInterface);

  this.m_config = Config.Get();
}

@wrapMethod(InputContextTransitionEvents)
protected final func OnDetach(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Void {
  wrappedMethod(stateContext, scriptInterface);

  this.m_config = null;
}

@wrapMethod(InputContextTransitionEvents)
protected final func SetBaseContextInputHints(context: ActiveBaseContext, stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
  if this.m_config.showInputHint && (Equals(context, ActiveBaseContext.Locomotion) || Equals(context, ActiveBaseContext.None)) {
    if !stateContext.GetBoolParameter(n"isDialogueHistoryPopupInputHintDisplayed", true) {
      this.ShowDialogueHistoryPopupInputHints(stateContext, scriptInterface);
    }
  } else {
    if stateContext.GetBoolParameter(n"isDialogueHistoryPopupInputHintDisplayed", true) {
      this.RemoveDialogueHistoryPopupInputHints(stateContext, scriptInterface);
    }
  }

  wrappedMethod(context, stateContext, scriptInterface);
}

@addMethod(InputContextTransitionEvents)
protected final func ShowDialogueHistoryPopupInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
  let localization = LocalizationSystem.GetInstance(scriptInterface.GetGame());
  let actionLabel = localization.GetText("DialogueHistory-Action-Label");

  this.ShowInputHint(scriptInterface, n"ShowDialogueHistory", n"DialogueHistoryPopup", actionLabel, inkInputHintHoldIndicationType.Press, true);

  stateContext.SetPermanentBoolParameter(n"isDialogueHistoryPopupInputHintDisplayed", true, true);
}

@addMethod(InputContextTransitionEvents)
protected final func RemoveDialogueHistoryPopupInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
  this.RemoveInputHintsBySource(scriptInterface, n"DialogueHistoryPopup");

  stateContext.RemovePermanentBoolParameter(n"isDialogueHistoryPopupInputHintDisplayed");
}

@wrapMethod(InputContextTransitionEvents)
protected final func RemoveAllInputHints(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) {
  this.RemoveDialogueHistoryPopupInputHints(stateContext, scriptInterface);
  wrappedMethod(stateContext, scriptInterface);
}

@wrapMethod(gameuiInGameMenuGameController)
private final func RegisterInputListenersForPlayer(playerPuppet: ref<GameObject>) {
  wrappedMethod(playerPuppet);

  if playerPuppet.IsControlledByLocalPeer() {
    playerPuppet.RegisterInputListener(this, n"ShowDialogueHistory");
  }
}

@wrapMethod(gameuiInGameMenuGameController)
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
  let result = wrappedMethod(action, consumer);

  let actionName = ListenerAction.GetName(action);
  let actionType = ListenerAction.GetType(action);

  if Equals(actionName, n"ShowDialogueHistory") && Equals(actionType, gameinputActionType.BUTTON_RELEASED) {
    if !Codeware.Require("1.1.4") {
      DHLogWarning("Codeware 1.1.4+ is required");
      return result;
    }

    DialogueHistoryPopup.Show(this);
    ListenerActionConsumer.DontSendReleaseEvent(consumer);
  }

  return result;
}
