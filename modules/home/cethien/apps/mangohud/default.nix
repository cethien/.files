{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.mangohud;
in
{
  options.${namespace}.apps.mangohud = {
    enable = mkBoolOpt false "Enable MangoHUD";
  };

  config = mkIf cfg.enable {
    programs.mangohud = {
      enable = true;
      settings = {
        fps_only = true;
      };
    };
  };
}
