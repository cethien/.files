{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.steam;
in
{
  options.${namespace}.apps.steam = {
    enable = mkBoolOpt false "Enable steam";
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
  };
}
