{pkgs, ...}:
{
  home.packages = with pkgs; [
    loupe
    imagemagick
  ];

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      # "image/jpeg" = "org.gnome.Loupe.desktop";
      # "image/png" = "org.gnome.Loupe.desktop";
    };
    defaultApplications = {
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/svg" = "org.gnome.Loupe.desktop";
    };
  };
}
