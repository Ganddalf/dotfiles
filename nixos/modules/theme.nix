{ pkgs, ... }:
let
  themes = {
    gruvbox = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    dracula = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  };
in
{
  stylix = {
    enable = true;
    base16Scheme = themes.gruvbox;
    image = ../../walpapers/forest.jpg;
    polarity = "dark";
    cursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e";
      size = 16;
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
