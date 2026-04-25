{ pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = "sioyek.desktop";
    };
    defaultApplications = {
      "application/pdf" = "sioyek.desktop";
      # "application/epub+zip" = "readest.desktop";
    };
  };

  home.packages = with pkgs; [
    kdePackages.okular
  ];

  # programs.zathura = {
  #   enable = true;
  #   options = {
  #     selection-clipboard = "clipboard";
  #   };
  # };

  programs.sioyek = {

    enable = true;

    bindings = {
      "move_up" = "k";
      "move_down" = "j";
      "move_left" = "h";
      "move_right" = "l";

      "move_down_page" = "<C-f>";
      "move_up_page" = "<C-b>";

      "goto_top_of_page" = "H";
      "goto_bottom_of_page" = "L";
      "next_page" = "J";
      "previous_page" = "K";

      "goto_beginning" = "gg";
      "goto_end" = "G";

      "zoom_in" = "+";
      "zoom_out" = "-";
      "fit_to_page_width" = "s";
      "fit_to_page_height" = "a";

      "search" = "/";
      "next_item" = "n";
      "previous_item" = "N";

      "rotate_clockwise" = "r";
      "rotate_counterclockwise" = "R";

      "goto_toc" = "<tab>";

      "toggle_dark_mode " = "<C-r>";

      "toggle_presentation_mode " = "<f5>";

      "quit" = "q";
    };

    config = {
      "case_sensitive_search" = "0";

      "show_doc_path" = "0";

      "should_draw_unrendered_pages" = "0";
    };

  };
}
