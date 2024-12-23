{ config, lib, pkgs, ... }:

{
  imports = [
    ./settings
  ];

  config = lib.mkIf config.deeznuts.desktop.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      plugins = with pkgs.hyprlandPlugins; [
        hyprspace
      ];
    };
  };
}
