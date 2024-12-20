{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.bat;
in
{
  options.${namespace}.cli.bat = {
    enable = mkBoolOpt true "Enable bat (better cat)";
  };

  config = mkIf cfg.enable {
    programs.bat.enable = true;
    home.shellAliases.cat = "bat -p";
  };
}
