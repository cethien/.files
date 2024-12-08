{ pkgs, ... }:

{
  programs.go = {
    enable = true;

    goPath = "go";
    goBin = "go/bin";      
  };

  home.packages = with pkgs; [
    gnumake
    gopls
    delve
  ];
}