{ pkgs, ... }:
let
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-full
      ;
  };
in
{
  home-manager.users.ganddalf.home.packages = [
    tex
    pkgs.tex-fmt
  ];
}
