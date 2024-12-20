{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.vscode;
in
{
  options.${namespace}.apps.vscode = {
    enable = mkBoolOpt false "Enable Visual Studio Code";
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        vscode-icons-team.vscode-icons
        catppuccin.catppuccin-vsc
        mads-hartmann.bash-ide-vscode
        jeff-hykin.better-nix-syntax
        pinage404.nix-extension-pack

        foxundermoon.shell-format
        timonwong.shellcheck
        esbenp.prettier-vscode
        tamasfe.even-better-toml
        redhat.vscode-yaml
        redhat.vscode-xml
      ];
    };
  };
}
