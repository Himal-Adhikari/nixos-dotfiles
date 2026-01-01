{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      marksman
      bash-language-server
      neocmakelsp
      vscode-langservers-extracted
      typescript-language-server
      ty
      taplo
      yaml-language-server
      nil
    ];

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        completion-trigger-len = 1;
        bufferline = "multiple";
        color-modes = true;
        scroll-lines = 5;
        lsp = {
          display-inlay-hints = true;
          display-signature-help-docs = false;
          display-messages = true;
        };
        soft-wrap = {
          enable = true;
        };
        cursor-shape = {
          insert = "bar";
        };
      };

      keys = {
        normal = {
          esc = [ "collapse_selection" "keep_primary_selection" ];
          A-l = [ ":toggle lsp.display-inlay-hints" ];
          J = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
          K = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
        };
      };
    };

    languages = {
      language = [
        {
           name = "rust";
           auto-format = true;
        }
      ];
      language-server.texlab.config.texlab.build = {
        onSave = true;
      };
    };
  };
}
