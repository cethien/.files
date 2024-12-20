{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.direnv;
in
{
  options.${namespace}.cli.direnv = {
    enable = mkBoolOpt false "Enable direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;

      config.global = {
        hide_env_diff = true;
      };
    };
  };
}
