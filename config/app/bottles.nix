{ pkgs, ...}:
{
  home.packages = with pkgs; [
    bottles
    wineWowPackages.full
    winetricks
  ];
}
