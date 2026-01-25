{pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-s";
    keyMode = "vi";
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
    ];
    terminal = "tmux-256color";
    baseIndex = 1;

    extraConfig = ''
    set-option -g xterm-keys on

    unbind '"'
    unbind %
    bind d split-window -c "#{pane_current_path}"
    bind s split-window -h -c "#{pane_current_path}"

    bind f resize-pane -Z

    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    bind-key -n C-Tab next-window
    bind-key -n C-BTab previous-window

    bind -n C-t new-window
    bind -n C-w killw

    set-window-option -g status-position top

    set -g @catppuccin_flavor "mocha"
    set -g @catppuccin_window_status_style "rounded"
    set -g @catppuccin_status_background "#242638" 
    set -g @catppuccin_window_current_text " #{b:pane_current_path}"
    set -g @catppuccin_window_text " #{b:pane_current_path}"

    # Load catppuccin
    run "~/.config/tmux/plugins/tmux/catppuccin.tmux"
    # Make the status line pretty and add some modules
    set -g status-right-length 100
    set -g status-left-length 100
    set -g status-left "#{E:@catppuccin_status_session}"
    set -g status-right "#{E:@catppuccin_status_application}"
    set-window-option -g status-position top
    '';

    # Now Prefix + x directly closes a pane
    disableConfirmationPrompt = true;

    # Navigate and resize panes using hjkl
    customPaneNavigationAndResize = true;
  };

}
