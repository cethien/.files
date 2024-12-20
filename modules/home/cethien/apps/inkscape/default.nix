{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.inkscape;
in
{
  options.${namespace}.apps.inkscape = {
    enable = mkBoolOpt false "Enable Inkscape";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ inkscape ];
  };
}
