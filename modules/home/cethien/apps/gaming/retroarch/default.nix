{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.gaming.retroarch;
in
{
  options.${namespace}.apps.gaming.retroarch = {
    enable = mkBoolOpt false "Enable RetroArch";
  };

  config = mkIf cfg.enable {
    home.packages =
      let
        retroarchWithCores = (pkgs.retroarch.withCores (cores: with cores; [
          mesen #NES
          bsnes #SNES
          mgba #GB / GBC / GBA
          mupen64plus #N64
          dolphin #GC / Wii
          desmume #NDS
          citra #N3DS
        ]));
      in
      [ retroarchWithCores ];
  };
}
