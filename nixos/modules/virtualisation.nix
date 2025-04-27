{ pkgs, ... }:
{
  # Docker
  virtualisation.docker.enable = true;

  # Virt-manager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "ganddalf" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    virtiofsd
    OVMF
  ];
}
