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

    ./config/gaming/gaming.nix

    ./config/lang/embeeded.nix

    ./config/lang/c_cpp/c_cpp.nix
    ./config/lang/rust/rust.nix
    ./config/lang/python/python.nix

    ./config/app/apps.nix
  ];

  home.file = {
  };

  home.sessionVariables = {

  };

}
