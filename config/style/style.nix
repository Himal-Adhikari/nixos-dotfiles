{ pkgs, ... }:

{
  home.packages = with pkgs; [
    glib
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
       theme=catppuccin-frappe-blue
     '';

     "Kvantum/catppuccin-frappe-blue".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/catppuccin-frappe-blue";
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
