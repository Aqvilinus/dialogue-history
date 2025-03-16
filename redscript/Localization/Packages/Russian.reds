module DialogueHistory.Localization.Packages

import Codeware.Localization.*

// Note for translators: Any text in curly braces should be kept as is, as it is
// a placeholder for a value that will be inserted into the string at runtime.

public class Russian extends ModLocalizationPackage {
  protected func DefineTexts() {
    // Основной заголовок и ярлык действия
    this.Text("DialogueHistory-Title",         "История диалогов");
    this.Text("DialogueHistory-Action-Label",  "История диалогов");

    // Категории журнала
    this.Text("DialogueHistory-UI-Category-Empty", "[Журнал пуст]");
    this.Text("DialogueHistory-UI-Category-Today", "Сегодня");
    this.Text("DialogueHistory-UI-Category-Day",   "День {int}");

    // Окно журнала
    this.Text("DialogueHistory-UI-Log-None",           "[Нет выбранной записи]");
    this.Text("DialogueHistory-UI-Log-Empty",          "[Нет доступных реплик]");
    this.Text("DialogueHistory-UI-Log-UnknownSpeaker", "Неизвестный говорящий");

    // Кнопки управления журналом
    this.Text("DialogueHistory-UI-Label-Clear",  "Очистить");
    this.Text("DialogueHistory-UI-Label-Delete", "Удалить");
    this.Text("DialogueHistory-UI-Label-Close",  "Закрыть");

    // Диалоговые окна подтверждения
    this.Text("DialogueHistory-UI-Prompt-Clear-Title",        "Очистить день");
    this.Text("DialogueHistory-UI-Prompt-Clear-Description",  "Вы действительно хотите очистить журнал за сегодня?");
    this.Text("DialogueHistory-UI-Prompt-Delete-Title",       "Удалить день");
    this.Text("DialogueHistory-UI-Prompt-Delete-Description", "Вы уверены, что хотите удалить журнал за день {int}?");

    // Настройки мода: Общие
    this.Text("DialogueHistory-Config-General",                            "Общее");
    this.Text("DialogueHistory-Config-General-InputHint-DisplayName",      "Добавить подсказку ввода");
    this.Text("DialogueHistory-Config-General-InputHint-Description",      "Добавлять ли подсказку ввода для всплывающего окна.");
    this.Text("DialogueHistory-Config-General-Lifecycle-DisplayName",      "Ротация журналов");
    this.Text("DialogueHistory-Config-General-Lifecycle-Description",      "Удалять ли журналы по прошествии заданного количества дней.");
    this.Text("DialogueHistory-Config-General-LifecycleDays-DisplayName",  "Дни");
    this.Text("DialogueHistory-Config-General-LifecycleDays-Description",  "Количество дней, в течение которых хранить журналы.");
    this.Text("DialogueHistory-Config-General-Persistent-DisplayName",     "Игнорировать постоянные субтитры");
    this.Text("DialogueHistory-Config-General-Persistent-Description",     "Исключать ли постоянные субтитры из журнала? Если отключено, может приводить к множеству записей с повторяющимися репликами.");

    // Настройки мода: Интерфейс
    this.Text("DialogueHistory-Config-Interface",                               "Интерфейс");
    this.Text("DialogueHistory-Config-Interface-ShowTime-DisplayName",          "Отображать время");
    this.Text("DialogueHistory-Config-Interface-ShowTime-Description",          "Отображать ли отметку времени для каждой реплики.");
    this.Text("DialogueHistory-Config-Interface-TimeFormat-DisplayName",        "Формат времени");
    this.Text("DialogueHistory-Config-Interface-TimeFormat-Description",        "Как следует форматировать время.");
    this.Text("DialogueHistory-Config-Interface-Animate-DisplayName",           "Анимировать");
    this.Text("DialogueHistory-Config-Interface-Animate-Description",           "Анимировать ли некоторые элементы всплывающего окна.");
    this.Text("DialogueHistory-Config-Interface-Height-DisplayName",            "Высота");
    this.Text("DialogueHistory-Config-Interface-Height-Description",            "Высота всплывающего окна.");
    this.Text("DialogueHistory-Config-Interface-Width-DisplayName",             "Ширина");
    this.Text("DialogueHistory-Config-Interface-Width-Description",             "Ширина всплывающего окна.");
    this.Text("DialogueHistory-Config-Interface-FontSize-DisplayName",          "Размер шрифта");
    this.Text("DialogueHistory-Config-Interface-FontSize-Description",          "Размер шрифта для реплик.");
    this.Text("DialogueHistory-Config-Interface-Margin-DisplayName",            "Отступ");
    this.Text("DialogueHistory-Config-Interface-Margin-Description",            "Расстояние между строками.");
    this.Text("DialogueHistory-Config-Interface-FrameColor-DisplayName",        "Цвет рамки");
    this.Text("DialogueHistory-Config-Interface-FrameColor-Description",        "Цвет рамки виджета.");
    this.Text("DialogueHistory-Config-Interface-TimeColor-DisplayName",         "Цвет времени");
    this.Text("DialogueHistory-Config-Interface-TimeColor-Description",         "Цвет отметки времени для реплики.");
    this.Text("DialogueHistory-Config-Interface-VNameColor-DisplayName",        "Цвет имени Ви");
    this.Text("DialogueHistory-Config-Interface-VNameColor-Description",        "Цвет имени Ви в субтитрах.");
    this.Text("DialogueHistory-Config-Interface-OverheadNameColor-DisplayName", "Цвет имени над головой");
    this.Text("DialogueHistory-Config-Interface-OverheadNameColor-Description", "Цвет имен в субтитрах, которые отображаются над головами (например, у NPC, с которыми вы взаимодействуете).");
    this.Text("DialogueHistory-Config-Interface-RadioNameColor-DisplayName",    "Цвет имени с радио");
    this.Text("DialogueHistory-Config-Interface-RadioNameColor-Description",    "Цвет имен в субтитрах радио.");
    this.Text("DialogueHistory-Config-Interface-GlobalTVNameColor-DisplayName", "Цвет имени с ТВ");
    this.Text("DialogueHistory-Config-Interface-GlobalTVNameColor-Description", "Цвет имен в субтитрах с телевизоров.");
    this.Text("DialogueHistory-Config-Interface-DefaultNameColor-DisplayName",  "Цвет имени по умолчанию");
    this.Text("DialogueHistory-Config-Interface-DefaultNameColor-Description",  "Цвет имен по умолчанию в субтитрах.");
    this.Text("DialogueHistory-Config-Interface-TextColor-DisplayName",         "Цвет текста субтитров");
    this.Text("DialogueHistory-Config-Interface-TextColor-Description",         "Цвет текста всех субтитров.");

    // Цвета
    this.Text("DialogueHistory-Color-White",        "Белый");
    this.Text("DialogueHistory-Color-Red",          "Красный");
    this.Text("DialogueHistory-Color-ActiveRed",    "Ярко-красный");
    this.Text("DialogueHistory-Color-MildRed",      "Нежно-красный");
    this.Text("DialogueHistory-Color-DarkRed",      "Тёмно-красный");
    this.Text("DialogueHistory-Color-FaintRed",     "Блекло-красный");
    this.Text("DialogueHistory-Color-Blue",         "Синий");
    this.Text("DialogueHistory-Color-ActiveBlue",   "Ярко-синий");
    this.Text("DialogueHistory-Color-MildBlue",     "Нежно-синий");
    this.Text("DialogueHistory-Color-DarkBlue",     "Тёмно-синий");
    this.Text("DialogueHistory-Color-FaintBlue",    "Блекло-синий");
    this.Text("DialogueHistory-Color-MediumBlue",   "Средне-синий");
    this.Text("DialogueHistory-Color-Yellow",       "Жёлтый");
    this.Text("DialogueHistory-Color-ActiveYellow", "Ярко-жёлтый");
    this.Text("DialogueHistory-Color-MildYellow",   "Нежно-жёлтый");
    this.Text("DialogueHistory-Color-Gold",         "Золотой");
    this.Text("DialogueHistory-Color-FaintYellow",  "Блекло-жёлтый");
    this.Text("DialogueHistory-Color-DarkGold",     "Тёмно-золотой");
    this.Text("DialogueHistory-Color-Green",        "Зелёный");
    this.Text("DialogueHistory-Color-MildGreen",    "Нежно-зелёный");
    this.Text("DialogueHistory-Color-ActiveGreen",  "Ярко-зелёный");
    this.Text("DialogueHistory-Color-DarkGreen",    "Тёмно-зелёный");
    this.Text("DialogueHistory-Color-Orange",       "Оранжевый");
    this.Text("DialogueHistory-Color-Grey",         "Серый");
    this.Text("DialogueHistory-Color-DarkGrey",     "Тёмно-серый");

    // Формат времени
    this.Text("DialogueHistory-TimeFormat-TwelveHour",     "12-часовой");
    this.Text("DialogueHistory-TimeFormat-TwentyFourHour", "24-часовой");
  }
}
