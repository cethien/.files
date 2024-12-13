{ inputs, system, user, ... }:

{
  imports =
    [
      ./hosts/${system.host}/hardware-configuration.nix
      ./modules

      inputs.home-manager.nixosModules.home-manager
      inputs.catppuccin.nixosModules.catppuccin

    ] ++ (if system.profile.isSurface then [
      inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
    ] else [ ]);

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  boot.loader.grub.enable = true;
  boot.loader.grub.device = system.grubDevice;
  boot.loader.grub.useOSProber = true;

  networking.hostName = system.host;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  console.keyMap = "de-latin1-nodeadkeys";

  home-manager = {
    extraSpecialArgs = { inherit inputs user system; };
    users."${user.username}" = import ./home.nix;
    backupFileExtension = "hm-backup-$(date +%Y%m%d_%H%M%S)";
  };

  system.stateVersion = "25.05"; # DO NOT CHANGE IF YOU DON'T KNOW WHAT YOU ARE DOING
}
