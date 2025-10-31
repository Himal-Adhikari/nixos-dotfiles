{ ... }:
{
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.fuse.userAllowOther = true;
}
