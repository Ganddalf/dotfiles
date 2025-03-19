{
  environment.sessionVariables = {
    TERMINAL = "ghostty";
  };

  home-manager.users.ganddalf.programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      font-size = 16;
      keybind = "f11=toggle_fullscreen";
    };
  };
}
