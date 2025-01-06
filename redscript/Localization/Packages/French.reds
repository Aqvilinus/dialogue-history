module DialogueHistory.Localization.Packages

import Codeware.Localization.*

// Note for translators: Any text in curly braces should be kept as is, as it is
// a placeholder for a value that will be inserted into the string at runtime.

public class French extends ModLocalizationPackage {
  protected func DefineTexts() {
    this.Text("DialogueHistory-Title",         "Historique des dialogues");
    this.Text("DialogueHistory-Action-Label",  "Historique des dialogues");

    this.Text("DialogueHistory-UI-Category-Empty", "[Pas d'historique disponible]");
    this.Text("DialogueHistory-UI-Category-Today", "Aujourd'hui");
    this.Text("DialogueHistory-UI-Category-Day",   "Jour {int}");

    this.Text("DialogueHistory-UI-Log-None",           "[Pas d'entrée sélectionner]");
    this.Text("DialogueHistory-UI-Log-Empty",          "[Pas de ligne disponible]");
    this.Text("DialogueHistory-UI-Log-UnknownSpeaker", "Orateur inconnu");

    this.Text("DialogueHistory-UI-Label-Clear",  "Effacer");
    this.Text("DialogueHistory-UI-Label-Delete", "Supprimer");
    this.Text("DialogueHistory-UI-Label-Close",  "Fermer");

    this.Text("DialogueHistory-UI-Prompt-Clear-Title",        "Effacer aujourd'hui");
    this.Text("DialogueHistory-UI-Prompt-Clear-Description",  "Êtes-vous sûr(e) de vouloir d'effacer le journal d'aujourd'hui ?");
    this.Text("DialogueHistory-UI-Prompt-Delete-Title",       "Supprimer le jour");
    this.Text("DialogueHistory-UI-Prompt-Delete-Description", "Êtes-vous sûr(e) de vouloir de supprimer le journal du jour {int} ?");

    this.Text("DialogueHistory-Config-General",                            "Général");
    this.Text("DialogueHistory-Config-General-InputHint-DisplayName",      "Ajouter une indication de saisie");
    this.Text("DialogueHistory-Config-General-InputHint-Description",      "Indique s'il faut ajouter une indication de saisie pour la fenêtre contextuelle.");
    this.Text("DialogueHistory-Config-General-Lifecycle-DisplayName",      "Cycle de vie");
    this.Text("DialogueHistory-Config-General-Lifecycle-Description",      "Indique s'il faut supprimer les journaux après un certain nombre de jours.");
    this.Text("DialogueHistory-Config-General-LifecycleDays-DisplayName",  "Jours");
    this.Text("DialogueHistory-Config-General-LifecycleDays-Description",  "Nombre de jours pendant lesquels les journaux doivent être conservés");
    this.Text("DialogueHistory-Config-General-Persistent-DisplayName",     "Ignorer les lignes persistantes");
    this.Text("DialogueHistory-Config-General-Persistent-Description",     "Indique si les sous-titres persistants ne doivent pas être stockés dans l'historique, ce qui entraînera probablement des lignes répétées si cette option est désactivée.");

    this.Text("DialogueHistory-Config-Interface",                               "Interface");
    this.Text("DialogueHistory-Config-Interface-Animate-DisplayName",           "Animer");
    this.Text("DialogueHistory-Config-Interface-Animate-Description",           "Indique si certaines parties de la fenêtre contextuelle doivent être animées.");
    this.Text("DialogueHistory-Config-Interface-Height-DisplayName",            "Hauteur");
    this.Text("DialogueHistory-Config-Interface-Height-Description",            "Hauteur de la fenêtre contextuelle");
    this.Text("DialogueHistory-Config-Interface-Width-DisplayName",             "Largeur");
    this.Text("DialogueHistory-Config-Interface-Width-Description",             "Largeur de la fenêtre contextuelle");
    this.Text("DialogueHistory-Config-Interface-FontSize-DisplayName",          "Taille de la police");
    this.Text("DialogueHistory-Config-Interface-FontSize-Description",          "Taille de la police pour les lignes");
    this.Text("DialogueHistory-Config-Interface-Margin-DisplayName",            "Marge");
    this.Text("DialogueHistory-Config-Interface-Margin-Description",            "Espace à laisser entre les lignes");
    this.Text("DialogueHistory-Config-Interface-FrameColor-DisplayName",        "Couleur du cadre");
    this.Text("DialogueHistory-Config-Interface-FrameColor-Description",        "Couleur du cadre du widget");
    this.Text("DialogueHistory-Config-Interface-VNameColor-DisplayName",        "Couleur du nom de V");
    this.Text("DialogueHistory-Config-Interface-VNameColor-Description",        "Couleur pour le nom de V dans les sous-titres");
    this.Text("DialogueHistory-Config-Interface-OverheadNameColor-DisplayName", "Couleur des noms (intéraction)");
    this.Text("DialogueHistory-Config-Interface-OverheadNameColor-Description", "Couleur des noms dans les sous-titres (par exemple, les PNJ avec lesquels vous interagissez)");
    this.Text("DialogueHistory-Config-Interface-RadioNameColor-DisplayName",    "Couleur des noms (radio)");
    this.Text("DialogueHistory-Config-Interface-RadioNameColor-Description",    "Couleur des noms dans les sous-titres des radios");
    this.Text("DialogueHistory-Config-Interface-GlobalTVNameColor-DisplayName", "Couleur des noms (TV)");
    this.Text("DialogueHistory-Config-Interface-GlobalTVNameColor-Description", "Couleur des noms dans les sous-titres des télévisions");
    this.Text("DialogueHistory-Config-Interface-DefaultNameColor-DisplayName",  "Couleur des noms par défaut");
    this.Text("DialogueHistory-Config-Interface-DefaultNameColor-Description",  "Couleur par défaut des noms dans les sous-titres");
    this.Text("DialogueHistory-Config-Interface-TextColor-DisplayName",         "Couleur du texte des sous-titres");
    this.Text("DialogueHistory-Config-Interface-TextColor-Description",         "Couleur du texte de tous les sous-titres");

    this.Text("DialogueHistory-Color-White", "Blanc");
    this.Text("DialogueHistory-Color-Red", "Rouge");
    this.Text("DialogueHistory-Color-ActiveRed", "Rouge vif");
    this.Text("DialogueHistory-Color-MildRed", "Rouge doux");
    this.Text("DialogueHistory-Color-DarkRed", "Rouge foncé");
    this.Text("DialogueHistory-Color-FaintRed", "Rouge clair");
    this.Text("DialogueHistory-Color-Blue", "Bleu");
    this.Text("DialogueHistory-Color-ActiveBlue", "Bleu vif");
    this.Text("DialogueHistory-Color-MildBlue", "Bleu doux");
    this.Text("DialogueHistory-Color-DarkBlue", "Bleu foncé");
    this.Text("DialogueHistory-Color-FaintBlue", "Bleu clair");
    this.Text("DialogueHistory-Color-MediumBlue", "Bleu moyen");
    this.Text("DialogueHistory-Color-Yellow", "Jaune");
    this.Text("DialogueHistory-Color-ActiveYellow", "Jaune vif");
    this.Text("DialogueHistory-Color-MildYellow", "Jaune doux");
    this.Text("DialogueHistory-Color-Gold", "Or");
    this.Text("DialogueHistory-Color-FaintYellow", "Jaune clair");
    this.Text("DialogueHistory-Color-DarkGold", "Or sombre");
    this.Text("DialogueHistory-Color-Green", "Vert");
    this.Text("DialogueHistory-Color-MildGreen", "Vert doux");
    this.Text("DialogueHistory-Color-ActiveGreen", "Vert vif");
    this.Text("DialogueHistory-Color-DarkGreen", "Vert foncé");
    this.Text("DialogueHistory-Color-Orange", "Orange");
  }
}
