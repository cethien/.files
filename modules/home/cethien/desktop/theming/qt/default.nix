{
  lib,
  pkgs,
  config,
  namespace,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.desktop.theming.qt;
in
{
  options.${namespace}.desktop.theming.qt = {
    enable = mkBoolOpt false "Enable QT Theming";
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;

      style.catppuccin.enable = true;
      style.name = "kvantum";
      platformTheme.name = "kvantum";
    };
  };
}