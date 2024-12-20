{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.hardware.bluetooth;
in
{
  options.${namespace}.hardware.bluetooth = {
    enable = mkBoolOpt false "Enable bluetooth";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
  };
}

