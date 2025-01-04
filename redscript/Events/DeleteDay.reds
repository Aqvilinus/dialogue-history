module DialogueHistory.Events

import DialogueHistory.Core.Day

public class DeleteDayEvent extends CallbackSystemEvent {
  private let day: wref<Day>;

  public func GetDay() -> wref<Day> {
    return this.day;
  }

  public static func Create(day: wref<Day>) -> ref<DeleteDayEvent> {
    let event = new DeleteDayEvent();
    event.day = day;

    return event;
  }
}