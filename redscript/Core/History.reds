module DialogueHistory.Core

import DialogueHistory.Utils.LineData

public class History extends ScriptableSystem {
  private let m_days: array<ref<Day>>;
  private let m_config: ref<Config>;

  private let m_callBackID: Uint32;

  private func OnAttach() -> Void {
    this.m_config = Config.Get();

    this.RegisterTimeSystemListener();
  }

  private func RegisterTimeSystemListener() -> Void {
    let timeSystem: ref<TimeSystem> = GameInstance.GetTimeSystem(this.GetGameInstance());

    let timeout: GameTime = GameTime.MakeGameTime(0, 24, 0, 0);
    let request: ref<DailyCallbackRequest> = new DailyCallbackRequest();
    let desiredTime = GameTime.MakeGameTime(0, 0, 0, 0);
    
    request.m_callBackID = timeSystem.RegisterScriptableSystemIntervalListener(n"DialogueHistory.Core.History", request, desiredTime, timeout, -1);
    this.m_callBackID = request.m_callBackID;
  }

  private func UnregisterTimeSystemListener() -> Void {
    // let timeSystem: ref<TimeSystem> = GameInstance.GetTimeSystem(this.GetGameInstance());
    // timeSystem.UnregisterListener(this.m_callBackID);
  }

  private final func OnDailyCallbackRequest(request: ref<DailyCallbackRequest>) -> Void {
    if !this.m_config.lifecycle {
      return;
    }

    let gameTime = GameInstance.GetTimeSystem(this.GetGameInstance()).GetGameTime();
    let currentDayNumber: Int32 = gameTime.Days();
    let daysToDelete: array<wref<Day>> = [];

    for day in this.GetDays() {
      if Abs(currentDayNumber - day.GetNumber()) > this.m_config.lifecycleDays {
        ArrayPush(daysToDelete, day);
      }
    }

    this.DeleteDays(daysToDelete);
  }

  private func OnDetach() -> Void {
    this.m_config = null;
    this.UnregisterTimeSystemListener();
  }

  public func AddLine(line: LineData) -> Void {
    if !(this.m_config.ignorePersistentLines && line.isPersistent) {
      this.GetCurrentDay().AddLine(line);
    } 
  }

  public func GetSize() -> Int32 {
    return ArraySize(this.m_days);
  }

  public func DeleteDay(day: wref<Day>) -> Void {
    ArrayRemove(this.m_days, day);
  }

  public func DeleteDays(days: array<wref<Day>>) -> Void {
    for day in days {
      this.DeleteDay(day);
    }
  }

  public func GetCurrentDay() -> ref<Day> {
    let num: Int32 = this.GetGameInstance().GetTimeSystem().GetGameTime().Days();
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