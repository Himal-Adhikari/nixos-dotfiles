{pkgs, config, ...}:
let
myAliases = {
  ls = "eza --icons";
  ll = "eza -la --icons";
  cd = "z";
  grep = "rg";
  cat = "bat";
  ssh = "kitty +kitten ssh";
};
in
{
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

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
      '';

    oh-my-zsh = {
      enable = true;
      theme = "muse";
    };
  };

  programs.bash = {
    enable = true;
  };

  programs.git = {
    enable = true;
  };
  
  home.packages = with pkgs; [
    ripgrep
    bat
    htop
    helix
    unzip
    wget
    unrar
    eza
    dust
    fd
    openssl 
    file
    dust
    yazi
    gitui
    zoxide
    tealdeer
    lshw
    gh
    btop
    neofetch
    fzf
  ];
  
}
