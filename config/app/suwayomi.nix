{ pkgs, ... }:
{

  environment.systemPackages = with pkgs;[
    suwayomi-server
  ];

  services.suwayomi-server = {
    enable = true;
    openFirewall = true;
    settings.server.extensionRepos = [
      "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json"
    ];
  };
}
