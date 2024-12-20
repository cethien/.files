{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.cli.gh;
in
{
  options.${namespace}.cli.gh = {
    enable = mkBoolOpt false "Enable github cli";
  };

  config = mkIf cfg.enable {
    programs.gh.settings = {
      enable = true;
      git_protocol = "ssh";
      prompt = "enable";
    };

    programs.gh-dash.enable = true;
  };
}
