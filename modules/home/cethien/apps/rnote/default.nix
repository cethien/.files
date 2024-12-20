{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.rnote;
in
{
  options.${namespace}.apps.rnote = {
    enable = mkBoolOpt false "Enable RNote";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ rnote ];
  };
}
