{ pkgs, ...}:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      gutenprintBin
      hplip
      cnijfilter2
      epson-escpr
      canon-cups-ufr2
      cups-filters
    ];
  };

  services.ipp-usb.enable = true;

  hardware.printers = {
    ensureDefaultPrinter = "USB_Printer";
    ensurePrinters = [
      {
        name = "USB_Printer";
        location = "USB (local, via ipp-usb)";
        description = "Local USB printer";
        deviceUri = "ipp://localhost:60000/ipp/print";
        model = "everywhere";
      }
    ];
  };

  services.printing.browsedConf = ''
    AutoClustering No
    LocalQueueNamingIPPPrinter DNS-SD
    BrowseFilter NOT name USB
  '';

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
