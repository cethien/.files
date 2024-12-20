{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.hardware.nvidia;
in
{
  options.${namespace}.hardware.nvidia = {
    enable = mkBoolOpt false "Enable NVIDIA GPU support";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;
  };
}
