{ pkgs, ... }:
{
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    nemo-with-extensions
    nemo-fileroller
  ];

  home-manager.users.ganddalf = {

    xdg.desktopEntries.nemo = {
      name = "Nemo";
      exec = "${pkgs.nemo-with-extensions}/bin/nemo";
      icon = "nemo";
    };

    xdg.mimeApps.defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-gnome-saved-search" = [ "nemo.desktop" ];

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
