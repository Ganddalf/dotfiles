{ pkgs, ... }:
{
  programs.zsh.enable = true;

  users.users.ganddalf.shell = pkgs.zsh;

  home-manager.users.ganddalf.programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
    };
    history.size = 10000;
    initExtra = "source ~/.p10k.zsh";
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
