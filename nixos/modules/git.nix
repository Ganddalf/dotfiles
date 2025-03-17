{
  home-manager.users.ganddalf.programs.git = {
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
}
