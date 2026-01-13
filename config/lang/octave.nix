{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ghostscript
    (octaveFull.withPackages (opkgs: with opkgs; [
      control
      symbolic
    ]))
  ];
}
