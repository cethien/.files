{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.gaming.primslauncher;
in
{
  options.${namespace}.apps.gaming.primslauncher = {
    enable = mkBoolOpt false "Enable Prism Launcher (Minecraft)";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ prismlauncher ];
  };
}
