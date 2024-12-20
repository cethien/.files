{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.fzf;
in
{
  options.${namespace}.cli.fzf = {
    enable = mkBoolOpt true "Enable fzf";
  };

  config = mkIf cfg.enable {
    programs.fzf.enable = true;
  };
}
