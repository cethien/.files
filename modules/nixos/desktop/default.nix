{ lib, ... }:

{
  imports = [
    ./gnome
    ./plasma
    ./hyprland
  ];

  options.deeznuts.desktop = {
    autoLogin.enable = lib.mkEnableOption "Enable autologin";
    autoLogin.user = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "The user to autologin as";
    };
  };

}
