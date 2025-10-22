{pkgs, ...}:
{
  home.packages = with pkgs; [
    loupe
  ];

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
    };
    defaultApplications = {
      "image/jpeg" = "org.gnome.Loupe.desktop";
    };
  };
}
