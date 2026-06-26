{...}:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$character";

      directory = {
        style = "blue";
        truncation_length = 100;
        truncate_to_repo = false;
      };

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };

      git_status = {
        style = "cyan";
      };

      git_state = {
        format = ''\([$state( $progress_current/$progress_total)]($style)\) '';
        style = "bright-black";
      };

      cmd_duration = {
        format = " [$duration]($style) ";
        style = "yellow";
      };

      # python = {
      #   format = "[$virtualenv]($style) ";
      #   style = "bright-black";
      # };
    };
  };
}
