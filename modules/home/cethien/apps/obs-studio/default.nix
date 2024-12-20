{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.obs-studio;
in
{
  options.${namespace}.apps.obs-studio = {
    enable = mkBoolOpt false "Enable OBS Studio";
  };

  config = mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-webkitgtk
        obs-vkcapture
        obs-pipewire-audio-capture

        advanced-scene-switcher
        obs-vertical-canvas
        obs-source-switcher
        obs-source-record
        obs-source-clone
        obs-shaderfilter
        obs-move-transition
        obs-gradient-source
        obs-composite-blur
        # obs-transition-table
      ];
    };
  };
}
