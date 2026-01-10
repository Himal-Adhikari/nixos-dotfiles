{pkgs, ...}:
{
  home.packages = with pkgs; [
    woeusb
    gparted
  ];
}
