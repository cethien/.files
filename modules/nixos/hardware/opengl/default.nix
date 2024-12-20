{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.hardware.opengl;
in
{
  options.${namespace}.hardware.opengl = {
    enable = mkBoolOpt false "Enable OpenGL support";
  };

  config = mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
