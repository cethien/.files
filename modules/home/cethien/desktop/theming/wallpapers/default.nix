{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.desktop.styling.wallpapers;
in
{
  options.${namespace}.desktop.styling.wallpapers = {
    enable = mkBoolOpt true "Enable Wallpapers";
  };

  config = mkIf cfg.enable {
    home.file."${config.home.homeDirectory}/Pictures/wallpapers".source = ./wallpapers;
  };
}
