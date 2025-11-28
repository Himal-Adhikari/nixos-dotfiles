{ ... }:
{

  programs.evince.enable = true;

  environment.pathsToLink = [
    "share/thumbnailers"
  ];
}
