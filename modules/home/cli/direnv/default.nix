{ config, lib, ... }:

{
  options.deeznuts.cli.direnv.enable = lib.mkEnableOption "Enable direnv";

  config = lib.mkIf config.deeznuts.cli.direnv.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;

      config.deeznuts.global = {
        hide_env_diff = true;
      };
    };
  };
}
