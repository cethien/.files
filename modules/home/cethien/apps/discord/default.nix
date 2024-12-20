{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.discord;
in
{
  options.${namespace}.apps.discord = {
    enable = mkBoolOpt false "Enable Discord";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      (discord-canary.override {
        withOpenASAR = true;
        withVencord = true;
      })
    ];
  };
}
