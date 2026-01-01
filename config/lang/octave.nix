{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (octaveFull.withPackages (opkgs: with opkgs; [
      control
      symbolic
    ]))
  ];
}
