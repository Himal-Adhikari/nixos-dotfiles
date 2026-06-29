{ ... }:
{
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8000 3000 8080 59010 8191 ];
  networking.firewall.allowedUDPPorts = [ 8000 3000 8080 59010 8191 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
}
