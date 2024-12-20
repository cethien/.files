{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.tmux;
in
{
  options.${namespace}.cli.tmux = {
    enable = mkBoolOpt true "Enable tmux";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        tmux-fzf
        resurrect
        better-mouse-mode
        prefix-highlight
      ];

      extraConfig = ''
        set -g mouse on
      '';
    };
  };
}
