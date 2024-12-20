{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.ripgrep;
in
{
  options.${namespace}.cli.ripgrep = {
    enable = mkBoolOpt true "Enable ripgrep (better grep)";
  };

  config = mkIf cfg.enable {
    programs.ripgrep.enable = true;
    home.shellAliases.grep = "rg --color=always";
  };
}
