{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.lazydocker;
in
{
  options.${namespace}.cli.lazydocker = {
    enable = mkBoolOpt false "Enable lazydocker";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ lazydocker ];
  };
}
