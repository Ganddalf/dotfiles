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

  # for terminal integration in https://github.com/SmartFinn/eve-ng-integration/blob/master/bin/eve-ng-integration
  environment.sessionVariables = {
    OVERRIDE_TERMINAL_CMD = "xdg-terminal-exec -e";
  };
}
