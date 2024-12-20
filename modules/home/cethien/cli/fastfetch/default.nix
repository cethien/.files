{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.fastfetch;
in
{
  options.${namespace}.cli.fastfetch = {
    enable = mkBoolOpt false "Enable fastfetch (neofetch alternative)";
  };

  config = mkIf cfg.enable {
    programs.fastfetch.enable = true;
  };
}
