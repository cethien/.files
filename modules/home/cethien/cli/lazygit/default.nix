{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.lazygit;
in
{
  options.${namespace}.cli.lazygit = {
    enable = mkBoolOpt false "Enable lazygit";
  };

  config = mkIf cfg.enable {
    programs.lazygit.enable = true;
  };
}
