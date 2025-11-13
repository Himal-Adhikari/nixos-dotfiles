{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    glib
    dconf 
    adwaita-icon-theme
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
    colorScheme = "dark";
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };

    gtk4.theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
  };
}
