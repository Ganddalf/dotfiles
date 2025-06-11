let
  stateVersion = "25.05";
in
{
  system.stateVersion = stateVersion;
  home-manager.users.ganddalf.home.stateVersion = stateVersion;
}
