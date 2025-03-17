{ pkgs, ... }:
{
  networking.hostName = "shire";
  networking.networkmanager.enable = true;
}
