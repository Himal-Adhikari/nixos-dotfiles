{ pkgs, ... }:
  let yazi-override = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;
  };
in
{

  programs.yazi = {
    enable = true;

    package = yazi-override;

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
      relative-motions = pkgs.yaziPlugins.relative-motions;
    };

    initLua = "require(\"relative-motions\"):setup({ show_numbers=\"relative\", show_motion = true, enter_mode =\"first\" })";

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
          on = "l"; 
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = "<C-n>";
          run = "shell 'dragon-drop -x -i -T \"$1\"'";
        }

        # Copy to System Clipboard
        {
          on = "y";
          run = [ "shell -- for f in \"$@\"; do echo \"file://$f\"; done | wl-copy -t text/uri-list" "yank" ];
          desc = "Copy files to system clipboard";
        }

        # Vim Relative Motions
        {
          on = [ "1" ];
          run = "plugin relative-motions 1";
          desc = "Move in relative steps";
        }
        {
          on = [ "2" ];
          run = "plugin relative-motions 2";
          desc = "Move in relative steps";
        }
        {
          on = [ "3" ];
          run = "plugin relative-motions 3";
          desc = "Move in relative steps";
        }
        {
          on = [ "4" ];
          run = "plugin relative-motions 4";
          desc = "Move in relative steps";
        }
        {
          on = [ "5" ];
          run = "plugin relative-motions 5";
          desc = "Move in relative steps";
        }
        {
          on = [ "6" ];
          run = "plugin relative-motions 6";
          desc = "Move in relative steps";
        }
        {
          on = [ "7" ];
          run = "plugin relative-motions 7";
          desc = "Move in relative steps";
        }
        {
          on = [ "8" ];
          run = "plugin relative-motions 8";
          desc = "Move in relative steps";
        }
        {
          on = [ "9" ];
          run = "plugin relative-motions 9";
          desc = "Move in relative steps";
        }
      ];
    };
  };
}
