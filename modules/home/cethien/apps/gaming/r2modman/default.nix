{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.gaming.r2modman;
in
{
  options.${namespace}.apps.gaming.r2modman = {
    enable = mkBoolOpt false "Enable R2ModMan (Mod Manager)";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ r2modman ];
  };
}
