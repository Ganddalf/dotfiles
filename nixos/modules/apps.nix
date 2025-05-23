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
    reaper
    yaak
    yazi
    xournalpp
    libreoffice-qt6
    hunspell
    hunspellDicts.ru_RU
    dbeaver-bin
    uv
    python312
    ktalk
    zoom-us
    gparted
    obs-studio
    jetbrains.idea-community
  ];

  programs.yandex-music.enable = true;
  programs.yandex-music.tray.enable = true;
}
