{ system, ... }:

{
  imports = [
    ./desktop
    ./apps
    ./gaming
    ./sh
    ./user-scripts

    ./hushlogin.nix
  ];

  catppuccin.enable = true;

  user.apps = {
    easyeffects.enable = !system.profile.isWSL;

    kitty.enable = !system.profile.isWSL;

    firefox.enable = !system.profile.isWSL;
    spotify.enable = !system.profile.isWSL;
    vscode.enable = !system.profile.isWSL;
    keepassxc.enable = !system.profile.isWSL;
    drawio.enable = !system.profile.isWSL;

    rnote.enable = system.profile.isSurface;

    discord.enable = system.profile.isHomePC;
    ocenaudio.enable = system.profile.isHomePC;
    inkscape.enable = system.profile.isHomePC;
    obs-studio.enable = system.profile.isHomePC;
  };

  user.desktop = {
    theming = {
      gtk.enable = true;
      qt.enable = true;
    };

    wallpaper.enable = !system.profile.isWSL;

    # gnome = {
    # extensions.enable = !system.profile.isWSL;
    # keybindings.enable = !system.profile.isWSL;
    # dconf-settings.enable = !system.profile.isWSL;
    # };
  };

  user.gaming = {
    mangohud.enable = system.profile.isHomePC || system.profile.isSurface;
    lutris.enable = system.profile.isHomePC;
    protonge.enable = system.profile.isHomePC;
    r2modman.enable = system.profile.isHomePC;
    retroarch.enable = system.profile.isHomePC;
    prism-launcher.enable = system.profile.isHomePC || system.profile.isSurface;
  };
}
