{ modulesPath
, lib
, pkgs
, inputs
, ...
}:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos
      inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
      (modulesPath + "/installer/scan/not-detected.nix")
      ./disk-config.nix
    ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking.hostName = "surface-7-pro";

  hardware.bluetooth.enable = true;
  audio.pipewire.enable = true;

  desktop = {
    fonts.enable = true;
    theming.enable = true;
    environment.gnome.enable = true;
  };

  virtualizing = {
    docker.enable = true;
    docker.users = [ "cethien" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."cethien" = import ./home.nix;
    backupFileExtension = "hm-backup-$(date +%Y%m%d_%H%M%S)";
  };
}
