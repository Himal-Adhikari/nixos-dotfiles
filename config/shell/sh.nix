{pkgs, config, ...}:
let
connect-package = pkgs.callPackage ./connect_script.nix { };
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
  ];
  
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
      plugins = [
        "direnv"
      ];
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
    neofetch
    fzf
    connect-package
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
