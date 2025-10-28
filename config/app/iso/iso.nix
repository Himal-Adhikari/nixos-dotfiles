{ pkgs, ... }:
{
  home.packages = with pkgs; [
    file-roller
  ];

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/vnd.efi.iso" = "org.gnome.FileRoller.desktop";
    };
  };
}
