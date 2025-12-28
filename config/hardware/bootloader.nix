{ ... }:
{
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    # grub = {
    #   enable = true;
    #   device = "nodev";
    #   useOSProber = true;
    #   efiSupport = true;
    # };
  };
}
