{ pkgs, ... }:
{
  home-manager.users.ganddalf.programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
