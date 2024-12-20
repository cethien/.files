{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.keepassxc;
in
{
  options.${namespace}.apps.keepassxc = {
    enable = mkBoolOpt false "Enable KeePassXC";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ keepassxc ];
  };
}
