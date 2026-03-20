{ types, mkOption }:
mkOption {
  default = { };
  description = "Max Cache sizes, in MiB";
  type = types.submodule;
  options = {
    image = mkOption {
      type = types.int;
      default = 256;
    };

    audio = mkOption {
      type = types.int;
      default = 4096;
    };

    video = mkOption {
      type = types.int;
      default = 8192;
    };
  };
}
