{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.fd;
in
{
  options.${namespace}.cli.fd = {
    enable = mkBoolOpt true "Enable fd (better find)";
  };

  config = mkIf cfg.enable {
    programs.fd.enable = true;

    home.shellAliases = {
      find = "fd";
      ff = "fd --type f";
      ffd = "fd --type d";
    };
  };
}
