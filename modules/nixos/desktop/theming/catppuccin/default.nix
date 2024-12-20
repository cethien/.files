{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.desktop.theming.catppuccin;
in
{
  options.${namespace}.desktop.theming.catppuccin = {
    enable = mkBoolOpt false "Enable catppuccin module";
  };

  config = mkIf cfg.enable {
    catppuccin.enable = true;
  };
}
