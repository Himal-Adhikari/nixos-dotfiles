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

    plugins = {
      smart-enter = pkgs.yaziPlugins.smart-enter;
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          run = "plugin smart-enter";
          on = "l"; 
          desc = "Enter the child directory, or open the file";
        }
      ];
    };
  };
}
