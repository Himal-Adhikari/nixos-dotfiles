{ lib, pkgs, config, ... }:
with lib;
{
  # options.drivers.nvidia = {
  #   enable = mkEnableOption "Enable Nvidia Drivers";
  # };


  # config = mkIf cfg.enable {
  #   services.xserver.videoDrivers = [ "nvidia" ];
    

  hardware.graphics = {
  	enable = true;
  	enable32Bit = true;
	  extraPackages = with pkgs; [
      rocmPackages.clr
	    vaapiVdpau
  	  libvdpau
  	  libvdpau-va-gl 
  	  nvidia-vaapi-driver
  	  vdpauinfo
	    libva
 		  libva-utils	
    	];
  	};

  services.xserver.enable = true;
  services.xserver.videoDrivers = [
    "modesettings"
    "nvidia"
  ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
      
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
      
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;
      
    #dynamicBoost.enable = true; # Dynamic Boost

    nvidiaPersistenced = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;
      
    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
      
    nvidiaSettings = true;
      
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    # offload = {
    #   enable = lib.mkOverride 990 true;
    #   enableOffloadCmd = lib.mkIf config.hardware.nvidia.prime.offload.enable true;
    # };
    sync.enable = true;

		# Make sure to use the correct Bus ID values for your system!
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
    # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
	};

	environment.sessionVariables = {
	  QT_QPA_PLATFORMTHEME = "wayland;xcb";
	  GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    ENABLE_VKBASALT = "1";
	};
}
