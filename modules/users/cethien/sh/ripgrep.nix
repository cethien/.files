{ ... }:

{
  programs.ripgrep.enable = true;

  home.shellAliases = {
    grep = "rg --color=always";
  };
}