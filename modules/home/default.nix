{ lib, inputs, config, ... }:
{
  options = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "cethien";
      description = "The user name to use for home-manager";
    };

    isWSL = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether the system is running in WSL";
    };
  };

  imports = [
    ../shared
    ./apps
    ./cli
    ./desktop-environment
    ./theming
    ./user-scripts
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.nur.modules.homeManager.default
    inputs.spicetify-nix.homeManagerModules.default
  ];

  config = {
    home.username = config.username;
    home.homeDirectory = "/home/${config.username}";

    home.stateVersion = "25.05"; # DO NOT CHANGE IF YOU DON'T KNOW WHAT YOU ARE DOING

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = (_: true);

    programs.home-manager.enable = true;
  };
} 
