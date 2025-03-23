{ pkgs, ... }:
{
  networking.hostName = "shire";
  networking.networkmanager.enable = true;

  users.groups.wireshark.members = [ "ganddalf" ];
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    wireshark-qt
    eve-ng-integration
  ];
}
