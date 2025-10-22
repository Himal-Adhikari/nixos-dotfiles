{ config, pkgs, ... }:

{
  home.username = "himal";
  home.homeDirectory = "/home/himal";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    ./config/wm/hyprland.nix

    ./config/shell/sh.nix

    ./config/style/style.nix

    ./config/misc.nix

    ./config/lang/stm32/stm32.nix
    ./config/lang/c_cpp/c_cpp.nix
    ./config/lang/rust/rust.nix

    ./config/pkgs/obsidian.nix
    ./config/pkgs/keepass.nix
    ./config/pkgs/pdf.nix
    ./config/pkgs/torrent.nix
    ./config/pkgs/helix.nix

    ./config/app/lutris/lutris.nix
    ./config/app/terminal/terminal.nix
    ./config/app/video/video.nix
    ./config/app/image/image.nix
    ./config/app/browser/browser.nix

  ];

  home.file = {
  };

  home.sessionVariables = {

  };

}
