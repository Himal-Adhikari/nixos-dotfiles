{pkgs, config, ...}:
let
myAliases = {
  ls = "eza --icons";
  ll = "eza -la --icons";
  cd = "z";
  grep = "rg";
  cat = "bat";
  ssh = "kitty +kitten ssh";
  connect = ''
  hostname -I
  curl -k 'https://10.100.1.1:8090/login.xml' -X POST -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0' -H 'Accept: /' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Origin: https://10.100.1.1:8090/' -H 'Connection: keep-alive' -H 'Referer: https://10.100.1.1:8090/httpclient.html' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'DNT: 1' -H 'Sec-GPC: 1' --data-raw 'mode=191&username=079bel035&password=2022-4691&a=1704110477577&producttype=0'
  '';
};
in
{
  imports = [
    ./tmux.nix
    ./btop.nix
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
    yazi
    gitui
    zoxide
    tealdeer
    lshw
    gh
    neofetch
    fzf
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };
}
