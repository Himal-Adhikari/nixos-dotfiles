{pkgs, ...}:
{
  home.packages = with pkgs; [
    gparted
    linux-wifi-hotspot
    hostapd
    iw
  ];
}
