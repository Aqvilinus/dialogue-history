module DialogueHistory.Events

import DialogueHistory.Core.Day

public class LogEvent extends CallbackSystemEvent {
  private let day: ref<Day>;

  public func GetDay() -> ref<Day> {
    return this.day;
  }

  public static func Create(day: ref<Day>) -> ref<LogEvent> {
    let event = new LogEvent();
    event.day = day;

    return event;
  }
}