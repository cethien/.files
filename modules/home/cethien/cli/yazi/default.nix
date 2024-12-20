{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.yazi;
in
{
  options.${namespace}.cli.yazi = {
    enable = mkBoolOpt true "Enable yazi (file browser tui)";
  };

  config = mkIf cfg.enable {
    programs.yazi.enable = true;
  };
}
