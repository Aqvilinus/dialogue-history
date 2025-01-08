module DialogueHistory.Listeners

import DialogueHistory.Core.History

@addField(BaseSubtitlesGameController)
public let m_history: ref<History>;

@wrapMethod(BaseSubtitlesGameController)
protected cb func OnInitialize() -> Bool {
  let result = wrappedMethod();

  this.m_history = History.Get(this.m_gameInstance);

  return result;
}

@wrapMethod(BaseSubtitlesGameController)
protected cb func OnUninitialize() -> Bool {
  this.m_history = null;

  return wrappedMethod();
}

@wrapMethod(BaseSubtitlesGameController)
private final func SpawnDialogLine(const lineData: script_ref<scnDialogLineData>) -> Void {
  wrappedMethod(lineData);

  let lineSpawnData = new LineSpawnData();
  lineSpawnData.Initialize(lineData);

  this.m_history.AddLine(lineSpawnData.m_lineData);
}
