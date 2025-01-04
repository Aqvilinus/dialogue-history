module DialogueHistory.Utils.String

public static final func StrToProperCase(string: String) -> String {
  // Parses the given string into proper case.
  //
  // When displaying subtitles, tv ads usually has the speaker names in all
  // lowercase and with underscores, for example: ad_arasaka. This helper
  // function will convert it to "Ad Arasaka", allowing for a better reading
  // experience when displaying subtitles.

  let words: array<String> = StrSplit(string, "_");
  let string: String = "";

  let i: Int32 = 0;

  while i < ArraySize(words) {
    let word = words[i];
    let end = i < ArraySize(words) - 1 ? " " : "";
    string += StrFrontToUpper(word) + end;

    i += 1;
  }

  return string;
}