{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.shells.oh-my-posh;
in
{
  options.${namespace}.cli.shells.oh-my-posh = {
    enable = mkBoolOpt true "Enable oh-my-posh";
  };

  config = mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;
      useTheme = "pure";
    };
  };
}
