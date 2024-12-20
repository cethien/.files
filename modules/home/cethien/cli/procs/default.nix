{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.procs;
in
{
  options.${namespace}.cli.procs = {
    enable = mkBoolOpt true "Enable procs (better ps)";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ procs ];
    home.shellAliases.ps = "procs";
  };
}
