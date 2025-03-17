{
  environment.sessionVariables = {
    EDITOR = "hx";
  };

  home-manager.users.ganddalf.programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        line-number = "relative";
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
