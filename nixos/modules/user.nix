{ inputs, ... }:
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
}
