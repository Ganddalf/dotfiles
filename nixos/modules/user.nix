{ inputs, config, ... }:
{
  users.users.ganddalf = {
    isNormalUser = true;
    description = "Ganddalf";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.ganddalf = {
      home.username = "ganddalf";
      home.homeDirectory = "/home/ganddalf";
      programs.home-manager.enable = true;
    };
  };

  home-manager.users.ganddalf = {
    xsession = {
      enable = true;
      windowManager.command = "…";
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
