{ ... }:
{
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8000 3000 8080];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
}
