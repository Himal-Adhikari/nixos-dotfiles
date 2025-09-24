{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    qt6ct
    gnome-themes-extra
    adwaita-icon-theme
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      "color-scheme" = "prefer-dark";
      # "gtk-theme" = "Adwaita-dark";
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
  };
}
