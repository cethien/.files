{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.misc;
in
{
  options.${namespace}.cli.misc = {
    enable = mkBoolOpt true "Enable misc cli tools";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      curl
      wget
      zip
      unzip
    ];
  };
}
