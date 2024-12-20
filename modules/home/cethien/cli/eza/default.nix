{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.eza;
in
{
  options.${namespace}.cli.eza = {
    enable = mkBoolOpt false "Enable eza (better ls)";
  };

  config = mkIf cfg.enable {
    programs.eza.enable = true;
    home.shellAliases = {
      ll = "eza -la --icons --group-directories-first --git";
      ls = "eza -1a --icons --group-directories-first --git";
      tree = "eza -T --icons";
    };
  };
}
