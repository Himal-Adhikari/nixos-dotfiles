{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    enableZshIntegration = true;
    flavors = {
      catppuccin_mocha = pkgs.callPackage ./catppuccin-mocha.nix { };
    };
    theme = {
      flavor = {
        dark = "catppuccin_mocha";
      };
    };
  };
}
