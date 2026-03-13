{
  mkOption,
  types,
}:
let
  availableLanguages = {
    "af_ZA.UTF-8" = "af";
    "ar_SA.UTF-8" = "ar";
    "bn_IN.UTF-8" = "bn";
    "bs_BA.UTF-8" = "bs";
    "de_DE.UTF-8" = "de";
    "en_US.UTF-8" = "en";
    "eo_EO.UTF-8" = "eo";
    "es_ES.UTF-8" = "es";
    "es_CO.UTF-8" = "es_CO";
    "fa_IR.UTF-8" = "fa";
    "fi_FI.UTF-8" = "fi";
    "fr_FR.UTF-8" = "fr";
    "hi_IN.UTF-8" = "hi";
    "id_ID.UTF-8" = "id";
    "it_IT.UTF-8" = "it";
    "ja_JP.UTF-8" = "ja";
    "ko_KR.UTF-8" = "ko";
    "nl_NL.UTF-8" = "nl";
    "pl_PL.UTF-8" = "pl";
    "pt_PT.UTF-8" = "pt";
    "ro_RO.UTF-8" = "ro";
    "ru_RU.UTF-8" = "ru";
    "sl_SI.UTF-8" = "sl";
    "sr_RS.UTF-8" = "sr";
    "ta_IN.UTF-8" = "ta";
    "tr_TR.UTF-8" = "tr";
    "uk_UA.UTF-8" = "uk";
    "vi_VN.UTF-8" = "vi";
    "zh_CN.UTF-8" = "zh";
    "zh_TW.UTF-8" = "zh_TW";
  };
in
mkOption {
  type = types.enum (builtins.attrNames availableLanguages);
  description = "Language used by Namida";
}
