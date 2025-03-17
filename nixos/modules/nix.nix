{ pkgs, inputs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 5";
    flake = "/home/ganddalf/dotfiles/nixos/";
  };

  home-manager.users.ganddalf.programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
