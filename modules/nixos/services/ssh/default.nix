{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.services.ssh;
  user = config.${namespace}.user;
in
{
  options.${namespace}.services.ssh = {
    enable = mkBoolOpt true "Enable ssh server";
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    users.users."${user.username}".openssh.authorizedKeys.keys = user.authorizedKeys;
  };
}
