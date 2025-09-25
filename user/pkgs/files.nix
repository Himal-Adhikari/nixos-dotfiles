{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    file-roller
  ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
