{ lib, config, ... }:

{
  options.apps.steam.enable = lib.mkEnableOption "Enable Steam";

  config = lib.mkIf config.apps.steam.enable {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
  };
}