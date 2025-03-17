{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nemo-with-extensions
  ];

  home-manager.users.ganddalf = {

    xdg.desktopEntries.nemo = {
      name = "Nemo";
      exec = "${pkgs.nemo-with-extensions}/bin/nemo";
      icon = "nemo";
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
      };
    };

    dconf = {
      settings = {
        "org/cinnamon/desktop/applications/terminal" = {
          exec = "ghostty";
        };
      };
    };
  };
}
