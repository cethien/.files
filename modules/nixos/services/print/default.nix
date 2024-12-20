{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.services.print;
in
{
  options.${namespace}.services.print = {
    enable = mkBoolOpt false "Enable printing";
  };

  config = mkIf cfg.enable {
    services.printing.enable = true;
  };
}
