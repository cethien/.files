{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.neovim;
in
{
  options.${namespace}.cli.neovim = {
    enable = mkBoolOpt true "Enable neovim (i use vim btw)";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;

      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        comment-nvim
        vim-nix
      ];

      extraConfig = ''
        set number
      '';
    };
  };
}
