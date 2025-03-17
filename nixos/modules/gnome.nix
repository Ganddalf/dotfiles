{
  config,
  pkgs,
  ...
}:
{
  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.udev.packages = [ pkgs.gnome-settings-daemon ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    pkgs.gnome-tweaks
    appindicator
    blur-my-shell
  ];

  environment.gnome.excludePackages = with pkgs; [
    orca
    evince
    file-roller
    geary
    gnome-disk-utility
    seahorse
    sushi
    sysprof
    gnome-backgrounds
    gnome-bluetooth
    gnome-tour
    gnome-user-docs
    baobab
    epiphany
    gnome-text-editor
    gnome-calculator
    gnome-calendar
    gnome-characters
    # gnome-clocks
    gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    # loupe
    # nautilus
    gnome-connections
    simple-scan
    snapshot
    totem
    yelp
    gnome-software
  ];

  home-manager.users.ganddalf = {
    xsession = {
      enable = true;
      windowManager.command = "…";
    };
    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false; # enables user extensions
          enabled-extensions = [
            "user-theme@gnome-shell-extensions.gcampax.github.com"
            "blur-my-shell@aunetx"
            "appindicatorsupport@rgcjonas.gmail.com"
          ];
          favorite-apps = [
            "org.gnome.Nautilus.desktop"
            "com.mitchellh.ghostty.desktop"
            "firefox.desktop"
            "org.telegram.desktop.desktop"
            "code.desktop"
          ];
        };
        "org/gnome/shell/app-switcher" = {
          current-workspace-only = true;
        };
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          accent-color = "purple";
          enable-hot-corners = false;
        };
        "org/gnome/mutter" = {
          edge-tiling = true;
          dynamic-workspaces = true;
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Control><Alt>t";
          command = "ghostty";
          name = "open-terminal";
        };
      };
    };
    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme.override { color = "violet"; };
      };
    };
    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        desktop = "${config.users.users.ganddalf.home}/Desktop";
        download = "${config.users.users.ganddalf.home}/Downloads";
        documents = "${config.users.users.ganddalf.home}/Documents";
        music = "${config.users.users.ganddalf.home}/Music";
        pictures = "${config.users.users.ganddalf.home}/Pictures";
        publicShare = "${config.users.users.ganddalf.home}/Public";
        templates = "${config.users.users.ganddalf.home}/Templates";
        videos = "${config.users.users.ganddalf.home}/Videos";
      };
    };
  };
}
