module DialogueHistory.Utils

public enum TimeFormat {
  TwelveHour = 0,
  TwentyFourHour = 1
}

private static final func PadTime(time: Int32) -> String {
  return time < 10 ? s"0\(time)" : IntToString(time);
}

public static final func FormatTwelveHour(line: LineData) -> String {
  return s"\(Equals(line.hour, 0) || Equals(line.hour, 12) ? 12 : line.hour % 12):\(PadTime(line.minute)) \(line.hour >= 12 ? "PM" : "AM")";
}

public static final func FormatTwentyFourHour(line: LineData) -> String {
  return s"\(PadTime(line.hour)):\(PadTime(line.minute))";
}