{ pkgs, ... }:
{
  home.packages = with pkgs; [
    texlab
    texliveFull
    pdf2svg
  ];
}
