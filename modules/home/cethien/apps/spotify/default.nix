{ lib
, pkgs
, config
, namespace
, inputs
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.spotify;
in
{
  options.${namespace}.apps.spotify = {
    enable = mkBoolOpt false "Enable Spotify";
  };

  config = mkIf cfg.enable {
    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          hidePodcasts
        ];
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
      };
  };
}
