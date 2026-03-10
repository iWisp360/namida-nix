{ mkOption, types }:
mkOption {
  default = "en_US";
  type = types.enum [
    "af"
    "bn"
    "bs"
    "es"
    "es_CO"
    "en_US"
    "nl_NL"
    "eo"
    "fi"
    "fr_FR"
    "de_DE"
    "hi_IN"
    "id_ID"
    "it_IT"
    "ja_JP"
    "ko"
    "fa_IR"
    "pl_PL"
    "pt_BR"
    "ro"
    "ru_RU"
    "sr_RS"
    "sl"
    "ta"
    "tr_TR"
    "uk_UA"
    "ur_PK"
    "vi_VN"
    "zh_tw"
    "zh_cn"
  ];

  description = "Language used by Namida";
}
