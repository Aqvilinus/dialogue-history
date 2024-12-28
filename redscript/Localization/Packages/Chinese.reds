module DialogueHistory.Localization.Packages

import Codeware.Localization.*

public class Chinese extends ModLocalizationPackage {
  protected func DefineTexts() {
    this.Text("DialogueHistory-Title",        "对话历史");
    this.Text("DialogueHistory-Action-Label", "对话历史");
    this.Text("DialogueHistory-Empty",        "[无对话内容]");

    this.Text("DialogueHistory-Config-General",                        "常规设置");
    this.Text("DialogueHistory-Config-General-InputHint-DisplayName",  "添加输入提示");
    this.Text("DialogueHistory-Config-General-InputHint-Description",  "是否为弹出窗口添加输入提示。");
    this.Text("DialogueHistory-Config-General-Limit-DisplayName",      "限制历史");
    this.Text("DialogueHistory-Config-General-Limit-Description",      "是否限制历史记录中存储的对话数。");
    this.Text("DialogueHistory-Config-General-MaxEntries-DisplayName", "存储限制");
    this.Text("DialogueHistory-Config-General-MaxEntries-Description", "历史记录中存储的最大对话数。");
    this.Text("DialogueHistory-Config-General-Persistent-DisplayName", "忽略持续对话");
    this.Text("DialogueHistory-Config-General-Persistent-Description", "是否在历史记录中存储持久字幕，禁用此功能很可能会导致重复对话。");

    this.Text("DialogueHistory-Config-Interface",                          "界面");
    this.Text("DialogueHistory-Config-Interface-Height-DisplayName",       "高度");
    this.Text("DialogueHistory-Config-Interface-Height-Description",       "弹窗高度。");
    this.Text("DialogueHistory-Config-Interface-Width-DisplayName",        "宽度");
    this.Text("DialogueHistory-Config-Interface-Width-Description",        "弹窗宽度。");
    this.Text("DialogueHistory-Config-Interface-FontSize-DisplayName",     "字体大小");
    this.Text("DialogueHistory-Config-Interface-FontSize-Description",     "对话对话的字体大小");
    this.Text("DialogueHistory-Config-Interface-Margin-DisplayName",       "间距");
    this.Text("DialogueHistory-Config-Interface-Margin-Description",       "对话与对话之间要留出的间距。");
    this.Text("DialogueHistory-Config-Interface-FrameColor-DisplayName",   "边框颜色");
    this.Text("DialogueHistory-Config-Interface-FrameColor-Description",   "部件边框的颜色。");
    this.Text("DialogueHistory-Config-Interface-SpeakerColor-DisplayName", "说话者颜色");
    this.Text("DialogueHistory-Config-Interface-SpeakerColor-Description", "说话者名字的颜色。");
    this.Text("DialogueHistory-Config-Interface-TextColor-DisplayName",    "文本颜色");
    this.Text("DialogueHistory-Config-Interface-TextColor-Description",    "文本的颜色。");

    this.Text("DialogueHistory-Color-White",   "白色");
    this.Text("DialogueHistory-Color-Red",     "红色");
    this.Text("DialogueHistory-Color-MildRed", "浅红色");
    this.Text("DialogueHistory-Color-Blue",    "蓝色");
    this.Text("DialogueHistory-Color-Yellow",  "黄色");
    this.Text("DialogueHistory-Color-Green",   "绿色");
    this.Text("DialogueHistory-Color-Orange",  "橙色");
  }
}
