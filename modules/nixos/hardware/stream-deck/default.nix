{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.hardware.stream-deck;
in
{
  options.${namespace}.hardware.stream-deck = {
    enable = mkBoolOpt false "Enable Stream Deck controls";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ streamcontroller ];
  };
}
