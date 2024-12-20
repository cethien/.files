{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.easyeffects;
in
{
  options.${namespace}.apps.easyeffects = {
    enable = mkBoolOpt false "Enable EasyEffects";
  };

  config = mkIf cfg.enable {
    services.easyeffects.enable = true;
  };
}
