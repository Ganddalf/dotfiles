{
  environment.sessionVariables = {
    # TERMINAL = "xterm-ghostty";
    # TERM = "xterm-ghostty";
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
