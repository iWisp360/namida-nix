{ lib }:
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
}
