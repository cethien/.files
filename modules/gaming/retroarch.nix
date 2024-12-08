{ lib, config, pkgs, ... }:

{
  options.gaming.retroarch.enable = lib.mkEnableOption "Enable retroarch";

  config = lib.mkIf config.gaming.retroarch.enable {
    environment.systemPackages = 
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
    [
      retroarchWithCores
    ];
  };
}