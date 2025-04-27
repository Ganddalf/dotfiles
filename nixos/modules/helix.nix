{
  environment.sessionVariables = {
    EDITOR = "hx";
  };

  home-manager.users.ganddalf.programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "dracula";
      editor = {
        line-number = "relative";
        color-modes = true;
        lsp.display-messages = true;
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
      ];
      language-server.nixd = {
        command = "nixd";
      };
    };
  };
}
