{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.shells.bash;
in
{
  options.${namespace}.cli.shells.bash = {
    enable = mkBoolOpt true "Enable bash shell";
  };

  config = mkIf cfg.enable {
    programs.bash.enable = true;

    programs.bash = {
      # TODO: port to snowfall
      # profileExtra =
      #   if system.profile.isWSL then ''
      #     if [ -e "${config.home.homeDirectory}"/.nix-profile/etc/profile.d/nix.sh ]; then
      #       source "${config.home.homeDirectory}"/.nix-profile/etc/profile.d/nix.sh;
      #     fi
      #   '' else "";

      initExtra = ''
        export PATH=$GOBIN:$PATH
        source $(blesh-share)/ble.sh
      '';
    };

    home.packages = with pkgs; [ blesh ];
  };
}
