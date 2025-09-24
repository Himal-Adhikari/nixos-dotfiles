{config, pkgs, kicad-nix, ... }:
{
  home.packages = with pkgs; [
    kicad-nix.kicad
  ];
}
