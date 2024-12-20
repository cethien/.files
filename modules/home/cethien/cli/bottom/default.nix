{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.bottom;
in
{
  options.${namespace}.cli.bottom = {
    enable = mkBoolOpt true "Enable bottom (btm)";
  };

  config = mkIf cfg.enable {
    programs.bottom = {
      enable = true;

      settings = {
        flags = {
          temperature_type = "c"; # Celsius
          rate_unit = "b";
          tree = true;
          process_command = true;
          cpu_as_percentage = true;
        };
      };
    };
  };
}
