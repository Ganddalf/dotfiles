{ pkgs, ... }:
{
  environment.sessionVariables = {
    EDITOR = "hx";
  };

  home-manager.users.ganddalf.programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "material_deep_ocean";
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
          formatter = with pkgs; {
            command = "${nixfmt-rfc-style}/bin/nixfmt";
          };
        }
      ];
      language-server.nixd = with pkgs; {
        command = "${nixd}/bin/nixd";
      };
    };
  };
}
