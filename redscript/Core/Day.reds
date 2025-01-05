module DialogueHistory.Core

import DialogueHistory.Utils.LineData

public class Day {
  private persistent let lines: array<LineData>;
  private persistent let number: Int32;
  private persistent let isToday: Bool = true;

  public func Initialize(day: Int32) -> Void {
    this.number = day;
  }

  public func Is(day: Int32) -> Bool {
    return Equals(this.number, day);
  }

  public func IsToday() -> Bool {
    return this.isToday;
  }

  public func SetPast() -> Void {
    this.isToday = false;
  }

  public func AddLine(line: LineData) -> Void {
    ArrayPush(this.lines, line);
  }

  public func GetLines() -> array<LineData> {
    return this.lines;
  }

  public func GetSize() -> Int32 {
    return ArraySize(this.lines);
  }

  public func GetNumber() -> Int32 {
    return this.number;
  }

  public func IsEmpty() -> Bool {
    return this.GetSize() == 0;
  }

  public func ClearLines() -> Void {
    ArrayClear(this.lines);
  }
}
