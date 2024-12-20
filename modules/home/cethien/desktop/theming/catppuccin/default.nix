{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.theming.catppuccin;
in
{
  options.${namespace}.theming.catppuccin = {
    enable = mkBoolOpt false "Enable catppuccin module";
  };

  config = mkIf cfg.enable {
    catppuccin.enable = true;
  };
}
