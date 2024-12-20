{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.desktop.plasma;
in
{
  options.${namespace}.desktop.plasma = {
    enable = mkBoolOpt false "Enable Plasma Desktop Environment";
  };

  config = mkIf cfg.enable {
    services.displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
    services.desktopManager.plasma6.enable = true;

    environment.plasma6.excludePackages = with pkgs; [
      khelpcenter
      kate
      kwalletmanager
      konsole
    ];

    environment.systemPackages = with pkgs.kdePackages; [
      dragon # video player
      kcolorchooser
      kalk # calculator
    ];

    programs.partition-manager.enable = true;

    programs.kdeconnect.enable = true;
  };
}
