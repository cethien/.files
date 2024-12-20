{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.jq;
in
{
  options.${namespace}.cli.jq = {
    enable = mkBoolOpt true "Enable jq";
  };

  config = mkIf cfg.enable {
    programs.jq.enable = true;
  };
}
