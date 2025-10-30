{ pkgs, ... }:
{
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.fuse.userAllowOther = true;

  environment.systemPackages = with pkgs; [
    steam-run
  ];
}
