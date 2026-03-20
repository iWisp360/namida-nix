{
  types,
  mkOption,
  config,
}:
mkOption {
  default = { };
  description = "database backup options";
  type = types.submodule {
    options = {
      location = mkOption {
        type = types.str;
        default = "${config.home.homeDirectory}/Namida/Backups";
      };

      autoBackupInterval = mkOption {
        type = types.int;
        default = 7;
        description = "Interval for automatic backups of the player database, in days (0 disables backups)";
      };
    };
  };
}
