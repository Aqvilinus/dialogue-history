module DialogueHistory.Core

import DialogueHistory.Utils.LineData
import DialogueHistory.Utils.String.StrToProperCase
import Codeware.Localization.LocalizationSystem

public class History extends ScriptableSystem {
  private persistent let m_days: array<ref<Day>>;

  private let m_config: ref<Config>;
  private let m_translator: ref<LocalizationSystem>;
  private let m_callBackID: Uint32;

  private func OnAttach() -> Void {
    this.m_config = Config.Get();
    this.m_translator = LocalizationSystem.GetInstance(this.GetGameInstance());

    this.RegisterTimeSystemListener();
  }

 private func OnDetach() -> Void {
    this.m_config = null;
    this.m_translator = null;

    // this.UnregisterTimeSystemListener();
  }

  private func RegisterTimeSystemListener() -> Void {
    let timeSystem: ref<TimeSystem> = this.GetGameInstance().GetTimeSystem();
    let desiredTime: GameTime = GameTime.MakeGameTime(0, 0, 0, 0);
    let timeout: GameTime = GameTime.MakeGameTime(0, 24, 0, 0);

    let request: ref<DailyCallbackRequest> = new DailyCallbackRequest();
    
    request.m_callBackID = timeSystem.RegisterScriptableSystemIntervalListener(n"DialogueHistory.Core.History", request, desiredTime, timeout, -1);
    this.m_callBackID = request.m_callBackID;
  }

  private func UnregisterTimeSystemListener() -> Void {
    this.GetGameInstance().GetTimeSystem().UnregisterListener(this.m_callBackID);
  }

  private final func OnDailyCallbackRequest(request: ref<DailyCallbackRequest>) -> Void {
    if !this.m_config.lifecycle {
      return;
    }

    let gameTime = GameInstance.GetTimeSystem(this.GetGameInstance()).GetGameTime();
    let currentDayNumber: Int32 = gameTime.Days();

    for day in this.GetDays() {
      if Abs(currentDayNumber - day.GetNumber()) > this.m_config.lifecycleDays {
        this.DeleteDay(day);
      }
    }
  } 

  public func AddLine(line: scnDialogLineData) -> Void {
     if this.m_config.ignorePersistentLines && line.isPersistent {
      return;
    }

    let displayText = line.GetDisplayText();
    let text: String;

    if NotEquals(displayText.language, scnDialogLineLanguage.Origin) && NotEquals(displayText.translation, "")  {
      text = displayText.translation;
    } else {
      text = line.text;
    }

    let rawSpeaker: String;

    if Equals(line.speakerName, "") {
      rawSpeaker = this.m_translator.GetText("DialogueHistory-UI-Log-UnknownSpeaker");
    } else {
      rawSpeaker = line.speakerName;
    }

    let speaker: String = StrContains(rawSpeaker, "_") ? StrToProperCase(rawSpeaker) : rawSpeaker;
    
    let gameTime: GameTime = this.GetGameInstance().GetTimeSystem().GetGameTime();
    let lineData: LineData = new LineData(StringToName(speaker), StringToName(text), line.type, gameTime.Hours(), gameTime.Minutes());

    this.GetToday(gameTime.Days()).AddLine(lineData);
  }

  public func GetSize() -> Int32 {
    return ArraySize(this.m_days);
  }

  public func DeleteDay(day: wref<Day>) -> Void {
    ArrayRemove(this.m_days, day);
  }

  public func GetToday(num: Int32) -> ref<Day> {
    let latest: ref<Day> = ArrayLast(this.m_days);

    if IsDefined(latest) && latest.Is(num) {
      return latest;
    } else if IsDefined(latest) {
      latest.SetPast();
    }

    let newDay: ref<Day> = new Day();
    newDay.Initialize(num);
    ArrayPush(this.m_days, newDay);

    return newDay;
  }

  public func GetDays() -> array<ref<Day>> {
    return this.m_days;
  }

  public static func Get(gameInstance: GameInstance) -> ref<History> {
    return GameInstance.GetScriptableSystemsContainer(gameInstance).Get(n"DialogueHistory.Core.History") as History;
  }
}

public class DailyCallbackRequest extends ScriptableSystemRequest {
  public let m_callBackID: Uint32;
}