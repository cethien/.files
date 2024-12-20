{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) types mkIf;
  inherit (lib.${namespace}) mkBoolOpt mkOpt;
  cfg = config.${namespace}.virtualisation.kvm;
in
{
  options.${namespace}.virtualisation.kvm = {
    enable = mkBoolOpt false "Enable KVM Virtualization";
    users = mkOpt types.list config.users.users "List of users that can work with VMs";
  };

  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    users.groups.libvirt.members = cfg.users;

    programs.virt-manager.enable = true;
  };
}
