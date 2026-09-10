{ pkgs, config, ... }:

# When installing MatLab in the distrobox container, install it inside the Matlab directory
# The directory structure is such that the binary is at ~/Matlab/bin/matlab
let
  matlabRoot = "${config.home.homeDirectory}/Matlab";
  matlabIcon = "${matlabRoot}/bin/glnxa64/cef_resources/matlab_icon.png";

  # The environment variable is for NVIDIA
  matlab = pkgs.writeShellScriptBin "matlab" ''
    exec ${pkgs.distrobox}/bin/distrobox enter distrobox-matlab -- \
      env LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 \
      ${matlabRoot}/bin/matlab "$@"
  '';
in

{
  programs.distrobox = {
    enable = true;

    containers.distrobox-matlab = {
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
        "libxrender1" "libxkbcommon0" "libxft2"
        "libgl1" "libglu1-mesa" "libglx-mesa0" "libgbm1" "libdrm2"
        "mesa-utils"
        "libgtk-3-0t64" "libnss3" "libnspr4" "libatk1.0-0t64"
        "libatk-bridge2.0-0t64" "libcups2t64" "libpango-1.0-0" "libcairo2"
        "libfontconfig1" "libfreetype6"
        "libasound2t64"
      ];

      init_hooks = [
      ];

      # Read from /run/cdi/nvidia-container-toolkit.json (nvidia.com/gpu=all).
      # additional_flags = "--device nvidia.com/gpu=all";
      pull = true;
      start_now = true;
    };
  };

  home.packages = with pkgs; [
    docker
    matlab
  ];


  xdg.desktopEntries.matlab = {
    name = "MATLAB R2025a";
    genericName = "Numerical Computing Environment";
    comment = "MATLAB";
    exec = "${matlab}/bin/matlab -desktop";
    icon = matlabIcon;
    terminal = false;
    startupNotify = true;
    categories = [ "Development" "Science" "Math" "Education" ];
  };
}
