{ pkgs, ... }:
{
  home-manager.users.ganddalf.programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      geequlim.godot-tools
      ms-azuretools.vscode-docker
      scalameta.metals
      mkhl.direnv
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
