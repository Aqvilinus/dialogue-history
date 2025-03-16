module DialogueHistory.Localization

import DialogueHistory.Localization.Packages.*
import Codeware.Localization.*

public class LocalizationProvider extends ModLocalizationProvider {
  public func GetPackage(language: CName) -> ref<ModLocalizationPackage> {
    switch language {
      case n"en-us":
        return new English();
      case n"fr-fr":
        return new French();
      case n"zh-cn":
        return new Chinese();
      case n"ru-ru":
        return new Russian();
      default:
        return null;
    }
  }

  public func GetFallback() -> CName {
    return n"en-us";
  }
}
