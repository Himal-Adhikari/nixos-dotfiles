{ pkgs, config, ... }:

# When installing MatLab in the distrobox container, install it inside the Matlab directory
# The directory structure is such that the binary is at ~/Matlab/bin/matlab
let
  matlabRoot = "${config.home.homeDirectory}/Matlab";
  matlabIcon = "${matlabRoot}/bin/glnxa64/cef_resources/matlab_icon.png";

  # The environment variable is for NVIDIA
  matlab = pkgs.writeShellScriptBin "matlab" ''
    exec ${pkgs.distrobox}/bin/distrobox enter my-ubuntu -- \
      env LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 \
      ${matlabRoot}/bin/matlab "$@"
  '';
in
{
  home.packages = [ matlab ];

  xdg.desktopEntries.matlab = {
    name = "MATLAB R2026a";
    genericName = "Numerical Computing Environment";
    comment = "MATLAB";
    exec = "${matlab}/bin/matlab -desktop";
    icon = matlabIcon;
    terminal = false;
    startupNotify = true;
    categories = [ "Development" "Science" "Math" "Education" ];
  };
}
