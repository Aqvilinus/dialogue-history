module DialogueHistory.Listener

import DialogueHistory.Utils.String.StrToProperCase
import DialogueHistory.Core.History
import DialogueHistory.Utils.LineData
import Codeware.Localization.LocalizationSystem

@addField(BaseSubtitlesGameController)
public let m_history: ref<History>;

@addField(BaseSubtitlesGameController)
public let m_translator: ref<LocalizationSystem>;

@wrapMethod(BaseSubtitlesGameController)
protected cb func OnInitialize() -> Bool {
  this.m_history = History.Get(GetGameInstance());
  this.m_translator = LocalizationSystem.GetInstance(GetGameInstance());

  return wrappedMethod();
}

@wrapMethod(BaseSubtitlesGameController)
protected cb func OnUninitialize() -> Bool {
  this.m_history = null;
  this.m_translator = null;

  return wrappedMethod();
}

@wrapMethod(BaseSubtitlesGameController)
private final func SpawnDialogLine(const lineData: script_ref<scnDialogLineData>) -> Void {
  wrappedMethod(lineData);

  let lineSpawnData: ref<LineSpawnData>;
  lineSpawnData = new LineSpawnData();
  lineSpawnData.Initialize(lineData);

  let data = lineSpawnData.m_lineData;
  let displayText = data.GetDisplayText();

  let text: String;

  if NotEquals(displayText.language, scnDialogLineLanguage.Origin) && NotEquals(displayText.translation, "")  {
    text = displayText.translation;
  } else {
    text = data.text;
  }

  let rawSpeaker: String;

  if Equals(data.speakerName, "") {
    rawSpeaker = this.m_translator.GetText("DialogueHistory-UI-Log-UnknownSpeaker");
  } else {
    rawSpeaker = data.speakerName;
  }

  let speaker: String = StrContains(rawSpeaker, "_") ? StrToProperCase(rawSpeaker) : rawSpeaker;
  this.m_history.AddLine(new LineData(StringToName(speaker), StringToName(text), data.type, data.isPersistent));
}
