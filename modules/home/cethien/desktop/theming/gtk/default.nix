{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.desktop.theming.gtk;
in
{
  options.${namespace}.desktop.theming.gtk = {
    enable = mkBoolOpt false "Enable GTK Theming";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;

      catppuccin = {
        enable = true;
        gnomeShellTheme = true;

        tweaks = [ "rimless" ];
      };

      iconTheme = {
        name = "Tela-dracula-dark";
        package = pkgs.tela-icon-theme;
      };

      cursorTheme = {
        name = "Nordzy-cursors";
        package = pkgs.nordzy-cursor-theme;
      };
    };
  };
}
