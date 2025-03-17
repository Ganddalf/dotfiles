{ pkgs, lib, inputs, ... }:
let 
  stateVersion = "24.11";
in 
{
  system.stateVersion = stateVersion;
  home-manager.users.ganddalf.home.stateVersion = stateVersion;
}
