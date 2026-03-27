{ pkgs, ... }:
{

  home.packages = with pkgs; [
    docker
  ];

  programs.distrobox = {
    enable = true;
  };
}
