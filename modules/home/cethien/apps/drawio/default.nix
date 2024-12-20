{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.drawio;
in
{
  options.${namespace}.apps.drawio = {
    enable = mkBoolOpt false "Enable draw.io app";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ drawio ];
  };
}
