{ pkgs, ... }:
{
  home.packages = with pkgs; [
    docker
  ];

  programs.distrobox = {
    enable = true;

    containers.my-ubuntu = {
      image = "ubuntu:24.04";

      additional_packages = [
        # Basic Stuff
        "ca-certificates"
        "curl" "wget"
        "unzip"
        "git"
        "build-essential"
        "locales"
        "software-properties-common"
        "bat" "zoxide" "vim" "ripgrep" "eza"

        # MATLAB Stuff
        "libx11-6" "libxext6" "libxt6" "libxrandr2" "libxi6" "libxfixes3"
        "libxcursor1" "libxinerama1" "libxcomposite1" "libxdamage1" "libxtst6"
        "libxrender1" "libxkbcommon0"
        "libgl1" "libglu1-mesa" "libglx-mesa0" "libgbm1" "libdrm2"
        "mesa-utils"
        "libgtk-3-0t64" "libnss3" "libnspr4" "libatk1.0-0t64"
        "libatk-bridge2.0-0t64" "libcups2t64" "libpango-1.0-0" "libcairo2"
        "libfontconfig1" "libfreetype6"
        "libasound2t64"
      ];

      init_hooks = [
      ];

      nvidia = true;
      pull = true;
      start_now = false;
    };
  };
}
