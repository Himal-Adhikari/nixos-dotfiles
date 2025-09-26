{pkgs, ...}:
{
  services.suwayomi-server = {
    enable = true;

    settings = {
      server = {
        enableSystemTray = true;
        port = 4567;
      };
    };
  };
}
