{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    amnezia-vpn
    outline-manager
  ];

  programs.amnezia-vpn.enable = true;
}
