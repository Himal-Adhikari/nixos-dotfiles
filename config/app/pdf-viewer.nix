{ pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };

  home.packages = [
    pkgs.kdePackages.okular
  ];

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}
