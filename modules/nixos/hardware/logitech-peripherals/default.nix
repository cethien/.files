{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.hardware.logitech-peripherals;
in
{
  options.${namespace}.hardware.logitech-peripherals = {
    enable = mkBoolOpt false "Enable logitech peripherals managment";
  };

  config = mkIf cfg.enable {
    hardware.logitech.wireless.enable = true;
    environment.systemPackages = with pkgs; [ solaar ];
  };
}
