module DialogueHistory.Utils

public struct LineData {
  public persistent let speakerName: CName;
  public persistent let text: CName;
  public persistent let type: scnDialogLineType;
  public persistent let hour: Int32;
  public persistent let minute: Int32;
}
