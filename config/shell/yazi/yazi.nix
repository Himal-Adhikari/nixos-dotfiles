{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;

    extraPackages = with pkgs; [
      dragon-drop
      exiftool
    ];
    
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
      mgr = {
        sort_by = "natural";
      };
      open.append_rules = [
        {
          mime = "image/*";
          use = "set-wallpaper";
        }
        {
          mime = "application/pdf";
          use = "okular";
        }
      ];
      opener.set-wallpaper = [
        {
          run  = "echo $1 > ~/.config/hypr/wallpaper-path.txt; killall swaybg; swaybg -m fill -i $1";
          for  = "linux";
          desc = "Set as wallpaper";
          orphan = true;
        }
      ];
      opener.okular = [
        {
          run  = "okular \"$1\"";
          for  = "linux";
          desc = "Open with Okular";
          orphan = true;
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
