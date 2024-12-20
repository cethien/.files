{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.gaming.protonge;
in
{
  options.${namespace}.apps.gaming.protonge = {
    enable = mkBoolOpt false "Enable Proton GE";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ protonup ];
    home.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.stream/root/compatibilitytools.d";
  };
}

