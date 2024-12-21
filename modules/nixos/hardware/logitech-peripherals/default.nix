{ pkgs, lib, config, ... }:

{
  options.hardware.logitech-peripherals.enable = lib.mkEnableOption "Enable Logitech peripherals support";

  config = lib.mkIf config.hardware.logitech-peripherals.enable {
    hardware.logitech.wireless.enable = true;
    environment.systemPackages = with pkgs; [ solaar ];
  };
}