{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      fira-code
      font-awesome
      jetbrains-mono
      material-icons
      adwaita-icon-theme
      fontconfig
    ];
    fontconfig = {
      useEmbeddedBitmaps = true;
      antialias = true;
      hinting.enable = true;
      subpixel.rgba = "rgb";
    };
  };
}
