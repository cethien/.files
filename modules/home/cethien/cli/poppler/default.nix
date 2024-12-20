{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.poppler;
in
{
  options.${namespace}.cli.poppler = {
    enable = mkBoolOpt false "Enable poppler utils";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ poppler_utils ];
  };
}
