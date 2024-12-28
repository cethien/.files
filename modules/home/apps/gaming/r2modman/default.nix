{ lib, config, pkgs, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.deeznuts.apps.gaming.r2modman;
in

{
  options.deeznuts.apps.gaming.r2modman = {
    enable = mkEnableOption "Enable r2modman(Thunderstore Mod Manager)";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ r2modman ];
  };
}
