{ ... }:
{
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 10;
    efi.canTouchEfiVariables = true;
    # grub = {
    #   enable = true;
    #   device = "nodev";
    #   useOSProber = true;
    #   efiSupport = true;
    # };
  };
}
