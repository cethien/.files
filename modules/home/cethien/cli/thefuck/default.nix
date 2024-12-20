{ config
, lib
, namespace
, ...
}:
with lib;
let
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.thefuck;
in
{
  options.${namespace}.cli.thefuck = {
    enable = mkBoolOpt true "Enable thefuck command correction tool";
  };

  config = mkIf cfg.enable {
    programs.thefuck = {
      enable = true;
      enableInstantMode = true; # Enable experimental instant mode for faster corrections
    };
  };
}
