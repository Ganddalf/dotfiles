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
    kdePackages.okular
    vlc
    obsidian
  ];

  programs.yandex-music.enable = true;
  programs.yandex-music.tray.enable = true;
}
