{pkgs, ...}:
{
  home.packages = with pkgs; [
    gparted
  ];

  programs.claude-code = {
    enable = true;
  };
}
