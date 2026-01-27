{ pkgs, ... }:
{

  home.packages = with pkgs; [
    dragon-drop
  ];

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

    settings = {
      opener.set-wallpaper = [
        {
          run  = "echo $1 > ~/.config/hypr/wallpaper-path.txt; killall swaybg; swaybg -m fill -i $1";
          for  = "linux";
          desc = "Set as wallpaper";
          orphan = true;
        
        }
      ];
      open.prepend_rules = [
        {
          mime = "image/*";
          use = "set-wallpaper";
        }
      ];
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          run = "plugin smart-enter";
          on = "l"; 
          desc = "Enter the child directory, or open the file";
        }
        {
          on = "<C-n>";
          run = "shell 'dragon-drop -x -i -T \"$1\"'";
        }
      ];
    };
  };
}
