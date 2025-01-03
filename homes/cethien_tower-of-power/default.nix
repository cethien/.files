{
  imports = [ ../../modules/home ];

  programs.home-manager.enable = true;

  deeznuts = {
    nixpkgs.allowUnfree = true;

    catppuccin.enable = true;

    desktop.hyprland = {
      enable = true;
    };

    cli.enable = true;

    apps = {
      easyeffects.enable = true;

      zen.enable = true;
      spotify.enable = true;
      vscode.enable = true;
      keepassxc.enable = true;
      drawio.enable = true;

      discord.enable = true;
      ocenaudio.enable = true;
      inkscape.enable = true;
      obs-studio.enable = true;

      gaming = {
        mangohud.enable = true;
        protonge.enable = true;

        r2modman.enable = true;
        retroarch.enable = true;
        prismlauncher.enable = true;
      };
    };

    terminals = {
      kitty.enable = true;
    };
  };
}
