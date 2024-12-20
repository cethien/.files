{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.terminals.kitty;
in
{
  options.${namespace}.apps.terminals.kitty = {
    enable = mkBoolOpt false "Enable Kitty terminal";
  };

  config = mkIf cfg.enable {
    programs.kitty.enable = true;
    programs.kitty = {
      font.name = "CodeNewRoman Nerd Font Mono";
      font.size = 14;
    };
  };
}
