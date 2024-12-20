{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.duf;
in
{
  options.${namespace}.cli.duf = {
    enable = mkBoolOpt true "Enable duf (better df)";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ duf ];
    home.shellAliases.df = "duf";
  };
}
