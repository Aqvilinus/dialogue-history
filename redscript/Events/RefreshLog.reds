module DialogueHistory.Events

public class RefreshLogEvent extends CallbackSystemEvent {
  public static func Create() -> ref<RefreshLogEvent> {
    return new RefreshLogEvent();
  }
}