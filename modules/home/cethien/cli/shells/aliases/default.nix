{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.shells.aliases;
in
{
  options.${namespace}.cli.shells.aliases = {
    enable = mkBoolOpt true "Enable shell aliases";
  };

  # TODO: need to rework these
  config = mkIf cfg.enable {
    home.shellAliases = {
      # rebuild = ''
      #   ${if system.profile.isNixos then "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/.files#${system.host}" else ""}
      #   ${if system.profile.isWSL then "home-manager switch --flake ${config.home.homeDirectory}/.files#${user.username} -b bak-$(date +%y%m%d%H%M%S)" else ""}
      # '';

      # update = ''
      #   ${if system.profile.isWSL then "sudo nala update && sudo nala upgrade -y" else ""}
      #   (cd ${config.home.homeDirectory}/.files && nix flake update)
      # '';

      # clean = ''
      #   ${if system.profile.isWSL then "sudo nala autoremove" else ""}
      #   nix-env --delete-generations 3d
      #   nix-store --gc
      # '';

      reload = "source ${config.home.homeDirectory}/.bashrc && clear";
    };
  };
}
