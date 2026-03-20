{ lib, jq }:
rec {
  intToFloat = num: num + 0.0;
  pow2 = num: if num == 0 then 1 else 2 * pow2 (num - 1);
  bitShiftLeft = num: positions: num * pow2 positions;
  hexToInt32Argb =
    hex:
    let
      r = lib.trivial.fromHexString (builtins.substring 1 2 hex);
      g = lib.trivial.fromHexString (builtins.substring 3 2 hex);
      b = lib.trivial.fromHexString (builtins.substring 5 2 hex);
      a = lib.trivial.fromHexString (builtins.substring 7 2 hex);
    in
    builtins.bitOr (bitShiftLeft a 24) (
      builtins.bitOr (bitShiftLeft r 16) (builtins.bitOr (bitShiftLeft g 8) b)
    );

  settingsWriteScript = src: target: ''
    HOME_MANAGER_CONFIGS=/tmp/settings.json
    NAMIDA_CONFIGS=${src}
    MERGED_CONFIGS=/tmp/new_settings.json

    echo '${target}' > $HOME_MANAGER_CONFIGS

    if [ -f $NAMIDA_CONFIGS ]; then
      ${jq}/bin/jq -s ".[0] * .[1]" $NAMIDA_CONFIGS $HOME_MANAGER_CONFIGS > $MERGED_CONFIGS
      cp $MERGED_CONFIGS $NAMIDA_CONFIGS -v
    else
      cp $HOME_MANAGER_CONFIGS $NAMIDA_CONFIGS
    fi

    rm $HOME_MANAGER_CONFIGS $MERGED_CONFIGS -f
  '';
}
