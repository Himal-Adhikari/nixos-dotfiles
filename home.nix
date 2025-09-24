{ config, pkgs, ... }:

{
  home.username = "himal";
  home.homeDirectory = "/home/himal";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./user/wm/hyprland.nix
    ./user/shell/sh.nix
    ./user/app/lutris/lutris.nix
    ./user/lang/stm32/stm32.nix
    ./user/lang/c_cpp/c_cpp.nix

    ./user/pkgs/obsidian.nix
    ./user/pkgs/kicad.nix
    ./user/pkgs/keepass.nix
    ./user/pkgs/pdf.nix
    ./user/pkgs/files.nix
    ./user/app/terminal/terminal.nix
    ./user/app/video/video.nix
    ./user/app/image/image.nix
    ./user/lang/rust/rust.nix
  ];

  home.file = {
    ".config/hypr/hyprland.conf".source = ./user/wm/hyprland.conf;
  };

  home.sessionVariables = {

  };

}
