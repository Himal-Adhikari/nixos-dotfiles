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

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
