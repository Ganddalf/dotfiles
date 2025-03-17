{ pkgs, ... }:
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
    users.ganddalf = {
      home.username = "ganddalf";
      home.homeDirectory = "/home/ganddalf";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };
}
