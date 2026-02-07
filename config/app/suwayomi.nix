{ lib, ... }:
{
  services.suwayomi-server = {
    enable = true;
    openFirewall = true;
    settings.server= {
      port = 4567;
    };
  };

  # Disable service at boot
  systemd.services.suwayomi-server.wantedBy = lib.mkForce [ ];
}
