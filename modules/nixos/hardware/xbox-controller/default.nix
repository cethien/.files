{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.hardware.xbox-controller;
in
{
  options.${namespace}.hardware.xbox-controller = {
    enable = mkBoolOpt false "Enable XBOX Controller support";
  };

  config = mkIf cfg.enable {
    hardware.xpadneo.enable = true;
  };
}
