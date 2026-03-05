{ pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "application/epub+zip" = "readest.desktop";
    };
  };

  home.packages = with pkgs; [
    kdePackages.okular
    readest
  ];

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}
