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
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_window_text " #{b:pane_current_path}"
          set -g @catppuccin_window_current_text " #{b:pane_current_path}"
        '';
      }
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

    bind e capture-pane -J -S - \; \
      save-buffer /tmp/tmux-scrollback.log \; \
      new-window -n scrollback "$EDITOR /tmp/tmux-scrollback.log; rm -f /tmp/tmux-scrollback.log"

    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    bind -n C-h if-shell -F "#{pane_at_left}"  "previous-window" "select-pane -L"
    bind -n C-l if-shell -F "#{pane_at_right}" "next-window"     "select-pane -R"
    bind -n C-j select-pane -D
    bind -n C-k select-pane -U

    bind -n C-t new-window -c "#{pane_current_path}"
    bind-key -n C-Tab next-window
    bind-key -n C-BTab previous-window

    bind -n C-q kill-session
    bind -n C-w kill-window

    bind r source-file ~/.config/tmux/tmux.conf \; display "tmux config reloaded"

    set -g status-right-length 100
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
