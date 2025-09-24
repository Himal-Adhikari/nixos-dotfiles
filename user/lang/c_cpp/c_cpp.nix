{config, pkgs, kicad-nix, ... }:
{
  home.packages = with pkgs; [
    cmake
    gnumake
    gcc
    libclang
  ];
}
