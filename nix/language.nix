{ mkOption, types }:
mkOption {
  default = "en";
  type = types.enum [
    "af"
    "ar"
    "bn"
    "bs"
    "de"
    "en"
    "eo"
    "es"
    "es_CO"
    "fa"
    "fi"
    "fr"
    "hi"
    "id"
    "it"
    "ja"
    "ko"
    "nl"
    "pl"
    "pt"
    "ro"
    "ru"
    "sl"
    "sr"
    "ta"
    "tr"
    "uk"
    "vi"
    "zh"
    "zh_TW"
  ];

  description = "Language used by Namida";
}
