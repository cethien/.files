{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.desktop.gnome;
in
{
  options.${namespace}.desktop.gnome = {
    enable = mkBoolOpt false "Enable GNOME Desktop Environment";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];

      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-photos
      gnome-music
      epiphany # web browser
      yelp # help
      seahorse # password manager
      gnome-console
    ];

    environment.systemPackages = with pkgs; [
      gnome-tweaks

      sushi # gnome file manager previewer
      decibels # gnome audio player
      drawing # gnome image editor
      video-trimmer # gnome video editor
      pika-backup # gnome backup tool
    ];

    programs.kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };
}
