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

  qt5Palette = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/catppuccin-mocha-blue.conf";
  qt6Palette = "${pkgs.catppuccin-qt5ct}/share/qt6ct/colors/catppuccin-mocha-blue.conf";

  qtctConf = palette: ''
    [Appearance]
    style=kvantum
    custom_palette=true
    color_scheme_path=${palette}
    standard_dialogs=default
  '';
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

    "qt5ct/colors/catppuccin-mocha-blue.conf".source = qt5Palette;
    "qt6ct/colors/catppuccin-mocha-blue.conf".source = qt6Palette;

    "qt5ct/qt5ct.conf" = {
      text = qtctConf qt5Palette;
      force = true;
    };
    "qt6ct/qt6ct.conf" = {
      text = qtctConf qt6Palette;
      force = true;
    };
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
