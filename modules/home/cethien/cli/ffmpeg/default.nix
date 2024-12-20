{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.ffmpeg;
in
{
  options.${namespace}.cli.ffmpeg = {
    enable = mkBoolOpt false "Enable ffmpeg";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ ffmpeg ];
  };
}
