module DialogueHistory.Localization.Packages

import Codeware.Localization.*

// keep text in {brackets}

public class English extends ModLocalizationPackage {
  protected func DefineTexts() {
    this.Text("DialogueHistory-Title",         "Dialogue History");
    this.Text("DialogueHistory-Action-Label",  "Dialogue History");

    this.Text("DialogueHistory-UI-Category-Empty", "[No History Available]");
    this.Text("DialogueHistory-UI-Category-Today", "Today");
    this.Text("DialogueHistory-UI-Category-Day",   "Day {num}");

    this.Text("DialogueHistory-UI-Log-None",           "[No entry selected]");
    this.Text("DialogueHistory-UI-Log-Empty",          "[No lines available]");
    this.Text("DialogueHistory-UI-Log-UnknownSpeaker", "Unknown Speaker");

    this.Text("DialogueHistory-UI-Label-Clear",  "Clear");
    this.Text("DialogueHistory-UI-Label-Delete", "Delete");
    this.Text("DialogueHistory-UI-Label-Close",  "Close");

    this.Text("DialogueHistory-UI-Prompt-Clear-Title",        "Clear Day");
    this.Text("DialogueHistory-UI-Prompt-Clear-Description",  "Are you sure you want to clear the log for today?");
    this.Text("DialogueHistory-UI-Prompt-Delete-Title",       "Delete Day");
    this.Text("DialogueHistory-UI-Prompt-Delete-Description", "Are you sure you want to delete the log for day {num}?");

    this.Text("DialogueHistory-Config-General",                            "General");
    this.Text("DialogueHistory-Config-General-InputHint-DisplayName",      "Add Input Hint");
    this.Text("DialogueHistory-Config-General-InputHint-Description",      "Whether to add an input hint for the popup.");
    this.Text("DialogueHistory-Config-General-Lifecycle-DisplayName",      "Lifecycle");
    this.Text("DialogueHistory-Config-General-Lifecycle-Description",      "Whether to delete logs after a certain amount of days.");
    this.Text("DialogueHistory-Config-General-LifecycleDays-DisplayName",  "Days");
    this.Text("DialogueHistory-Config-General-LifecycleDays-Description",  "The amount of days to keep logs.");
    this.Text("DialogueHistory-Config-General-Persistent-DisplayName",     "Ignore Persistent Lines");
    this.Text("DialogueHistory-Config-General-Persistent-Description",     "Whether to not store persistent subtitles in the history, which will most likely lead to repeated lines if disabled.");

    this.Text("DialogueHistory-Config-Interface",                          "Interface");
    this.Text("DialogueHistory-Config-Interface-Animate-DisplayName",      "Animate");
    this.Text("DialogueHistory-Config-Interface-Animate-Description",      "Whether if some parts of the popup should animate.");
    this.Text("DialogueHistory-Config-Interface-Height-DisplayName",       "Height");
    this.Text("DialogueHistory-Config-Interface-Height-Description",       "The height of the popup.");
    this.Text("DialogueHistory-Config-Interface-Width-DisplayName",        "Width");
    this.Text("DialogueHistory-Config-Interface-Width-Description",        "The width of the popup.");
    this.Text("DialogueHistory-Config-Interface-FontSize-DisplayName",     "Font Size");
    this.Text("DialogueHistory-Config-Interface-FontSize-Description",     "The font size for lines.");
    this.Text("DialogueHistory-Config-Interface-Margin-DisplayName",       "Margin");
    this.Text("DialogueHistory-Config-Interface-Margin-Description",       "The amount of space to leave between lines.");
    this.Text("DialogueHistory-Config-Interface-FrameColor-DisplayName",   "Frame Color");
    this.Text("DialogueHistory-Config-Interface-FrameColor-Description",   "The color of the frame of the widget.");
    this.Text("DialogueHistory-Config-Interface-SpeakerColor-DisplayName", "Speaker Color");
    this.Text("DialogueHistory-Config-Interface-SpeakerColor-Description", "The default color for speakers.");
    this.Text("DialogueHistory-Config-Interface-VSpeakerColor-DisplayName", "V Speaker Color");
    this.Text("DialogueHistory-Config-Interface-VSpeakerColor-Description", "The speaker color for V.");
    this.Text("DialogueHistory-Config-Interface-TextColor-DisplayName",    "Text Color");
    this.Text("DialogueHistory-Config-Interface-TextColor-Description",    "The color of the text.");

    this.Text("DialogueHistory-Color-White", "White");
    this.Text("DialogueHistory-Color-Red", "Red");
    this.Text("DialogueHistory-Color-ActiveRed", "Active Red");
    this.Text("DialogueHistory-Color-MildRed", "Mild Red");
    this.Text("DialogueHistory-Color-DarkRed", "Dark Red");
    this.Text("DialogueHistory-Color-FaintRed", "Faint Red");
    this.Text("DialogueHistory-Color-Blue", "Blue");
    this.Text("DialogueHistory-Color-ActiveBlue", "Active Blue");
    this.Text("DialogueHistory-Color-MildBlue", "Mild Blue");
    this.Text("DialogueHistory-Color-DarkBlue", "Dark Blue");
    this.Text("DialogueHistory-Color-FaintBlue", "Faint Blue");
    this.Text("DialogueHistory-Color-MediumBlue", "Medium Blue");
    this.Text("DialogueHistory-Color-Yellow", "Yellow");
    this.Text("DialogueHistory-Color-ActiveYellow", "Active Yellow");
    this.Text("DialogueHistory-Color-MildYellow", "Mild Yellow");
    this.Text("DialogueHistory-Color-Gold", "Gold");
    this.Text("DialogueHistory-Color-FaintYellow", "Faint Yellow");
    this.Text("DialogueHistory-Color-DarkGold", "Dark Gold");
    this.Text("DialogueHistory-Color-Green", "Green");
    this.Text("DialogueHistory-Color-MildGreen", "Mild Green");
    this.Text("DialogueHistory-Color-ActiveGreen", "Active Green");
    this.Text("DialogueHistory-Color-DarkGreen", "Dark Green");
    this.Text("DialogueHistory-Color-Orange", "Orange");
  }
}
