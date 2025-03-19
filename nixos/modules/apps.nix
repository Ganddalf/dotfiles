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
    godot_4
    kdePackages.okular
    vlc
    obsidian
    qbittorrent-enhanced
    aseprite
    blender
    gimp
    inkscape
    easyeffects
    reaper
    yaak
    yazi
    amberol
    xournalpp
  ];

  programs.yandex-music.enable = true;
  programs.yandex-music.tray.enable = true;
}
