{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.ocenaudio;
in
{
  options.${namespace}.apps.ocenaudio = {
    enable = mkBoolOpt false "Enable Ocenaudio";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ ocenaudio ];
  };
}
