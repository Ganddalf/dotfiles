{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ganddalf";
  home.homeDirectory = "/home/ganddalf";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ganddalf/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # For graphical services
  xsession.enable = true;
  xsession.windowManager.command = "…";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
    };
    history.size = 10000;
    # support for powerlevel10k
    initExtra = "source ~/.p10k.zsh";
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  # Ghostty
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 16;
      theme = "MaterialOcean";
      keybind = "f11=toggle_fullscreen";
    };
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Mikhail Oleinik";
    userEmail = "ganddalf@ya.ru";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    diff-so-fancy = {
      enable = true;
    };
  };

  # Helix configuration
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "material_deep_ocean";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
    # Languages configuration for Helix
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

  # VS Code configuration
  # MAYBE: do this nix way
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
