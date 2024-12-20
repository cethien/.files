{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf types;
  inherit (lib.${namespace}) mkBoolOpt mkOpt;
  cfg = config.${namespace}.virtualisation.docker;
in
{
  options.${namespace}.virtualisation.docker = {
    enable = mkBoolOpt false "Enable docker virtualization";
    users = mkOpt types.list config.users.users "List of users that can work with docker";
  };

  config = mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = cfg.users;
  };
}
