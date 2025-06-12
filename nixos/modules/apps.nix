{
  pkgs,
  ...
}:
let
  yandex-music-custom = pkgs.yandex-music.override {
    trayEnabled = true;
  };
in
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
    gimp3
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
    yandex-music-custom
    darktable
    digikam
  ];

  home-manager.users.ganddalf.xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "okularApplication_pdf.desktop" ];
      "image/webp" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.inkscape.Inkscape.desktop" ];
    };
  };
}
