{ pkgs, ... }:
{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    protonup-qt
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
  ];

  hardware.xone.enable = true;
}
