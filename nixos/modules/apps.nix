{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    curl
    htop
    fastfetch
    telegram-desktop
    discord
    appimage-run
    amnezia-vpn
    godot_4
  ];
}
