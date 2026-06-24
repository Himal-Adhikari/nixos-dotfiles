{ pkgs, ... }:

let
  catppuccinKvantumMocha = pkgs.catppuccin-kvantum.override {
    variant = "mocha";
    accent = "blue";
  };

  catppuccinGtkMocha = pkgs.catppuccin-gtk.override {
    variant = "mocha";
    accents = [ "blue" ];
    size = "standard";
  };
in
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
      theme=catppuccin-mocha-blue
    '';

    "Kvantum/catppuccin-mocha-blue".source =
      "${catppuccinKvantumMocha}/share/Kvantum/catppuccin-mocha-blue";
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "catppuccin-mocha-blue-standard";
      package = catppuccinGtkMocha;
    };

    gtk4.theme = {
      name = "catppuccin-mocha-blue-standard";
      package = catppuccinGtkMocha;
    };
  };
}
