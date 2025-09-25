{ pkgs, ... }:

{
  home.packages = with pkgs; [
    glib
    dconf 
  ];
  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
       [General]
       theme=MateriaDark
     '';

     "Kvantum/Materia".source = "${pkgs.materia-kde-theme}/share/Kvantum/Materia";
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
      "gtk-theme" = "Adwaita-dark";
    };
  };
}
