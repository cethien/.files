{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.desktop.fonts;
in
{
  options.${namespace}.desktop.fonts = {
    enable = mkBoolOpt false "Enable additional fonts";
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      roboto
      open-sans

      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.code-new-roman
    ];
  };
}
