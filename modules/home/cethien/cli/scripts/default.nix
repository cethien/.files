{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.scripts;
in
{
  options.${namespace}.cli.scripts = {
    enable = mkBoolOpt true "Enable scripts";
  };

  config = mkIf cfg.enable {
    home.file."${config.home.homeDirectory}/.scripts".source = ./scripts;
    home.shellAliases = {
      init = "source ${config.home.homeDirectory}/.scripts/init.sh";
    };
  };
}
