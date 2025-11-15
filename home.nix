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

    ./config/lang/languages.nix

    ./config/app/apps.nix
  ];

  home.file = {
  };

  home.sessionVariables = {

  };

}
