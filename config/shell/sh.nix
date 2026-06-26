{pkgs, config, ...}:
let
myAliases = {
  ls = "eza --icons auto";
  ll = "eza -la --icons auto";
  cd = "z";
  grep = "rg";
  cat = "bat";
  ssh = "kitty +kitten ssh";
};
in
{
  imports = [
    ./tmux.nix
    ./btop.nix
    ./yazi/yazi.nix
    ./git.nix
  ];
  
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    completionInit = "autoload -U compinit && compinit -C";

    # Skip /etc/zprofile and /etc/zshrc. Must be in .zshenv since those run before .zshrc.
    envExtra = "setopt no_global_rcs";

    dotDir = "${config.home.homeDirectory}/.config/zsh";

    history = {
      path = "${config.home.homeDirectory}/.config/zsh/zsh_history";
      size = 100000;
      share = true;
    };
    initContent = ''
      eval "$(zoxide init zsh)"
      unsetopt BEEP
      stty -ixon
      bindkey -v
      export KEYTIMEOUT=1
      bindkey '^R' history-incremental-search-backward
      bindkey '^[l' clear-screen
      bindkey -M vicmd '_' vi-first-non-blank

      # muse-style prompt: cwd (branch) ✘ ᐅ
      # ᐅ is green on success, red on last-command failure.
      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' stagedstr     ' %F{magenta}✘%f'
      zstyle ':vcs_info:git:*' unstagedstr   ' %F{magenta}✘%f'
      zstyle ':vcs_info:git:*' formats       ' %F{blue}(%b)%f%c%u'
      zstyle ':vcs_info:git:*' actionformats ' %F{blue}(%b|%a)%f%c%u'
      precmd_functions+=(vcs_info)
      setopt PROMPT_SUBST
      PROMPT='%F{117}%~%f''${vcs_info_msg_0_} %(?.%F{green}.%F{red})ᐅ%f '
      '';
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };

  home.packages = with pkgs; [
    ripgrep
    bat
    htop
    unzip
    wget
    unrar
    eza
    dust
    fd
    openssl 
    file
    dust
    gitui
    zoxide
    tealdeer
    lshw
    gh
    fzf
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
