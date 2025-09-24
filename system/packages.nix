{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    coreutils-full
    vim
    curl
    mesa
  ];
}

