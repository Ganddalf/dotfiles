{ pkgs, ... }:

{
  home-manager.users.ganddalf.programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      font-size = 16;
      theme = "MaterialOcean";
      keybind = "f11=toggle_fullscreen";
    };
  };
}
