{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.shells.hushlogin;
in
{
  options.${namespace}.cli.shells.hushlogin = {
    enable = mkBoolOpt true "Enable hushlogin file";
  };

  config = mkIf cfg.enable {
    home.file."${config.home.homeDirectory}/.hushlogin".text = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
  };
}
