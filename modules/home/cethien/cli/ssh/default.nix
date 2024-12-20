{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.ssh;
in
{
  options.${namespace}.cli.ssh = {
    enable = mkBoolOpt true "Enable ssh client";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;

      forwardAgent = true;
      addKeysToAgent = "yes";
    };
  };
}
