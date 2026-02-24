# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, username, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./config/hardware-configuration.nix
      ./config/hardware/nvidia-drivers.nix
      ./config/hardware/intel-drivers.nix
      ./config/hardware/laptop.nix
      ./config/hardware/audio.nix
      ./config/hardware/bootloader.nix
      ./config/hardware/networking.nix
      ./config/hardware/bluetooth.nix
      ./config/hardware/firewall.nix
      ./config/hardware/printing.nix

      ./config/fonts.nix
      ./config/login.nix

      ./config/shell/nix-ld.nix

      ./config/appimage.nix
      ./config/gaming/gamemode.nix

      ./config/app/files.nix
      ./config/app/localsend.nix
      ./config/app/suwayomi.nix
      
      ./config/udev_rules/controller.nix
    ];

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.gnome-disks.enable = true;

  # services.xserver.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;
  services.openssh.enable = true;
  services.udisks2.enable = true;

  programs.hyprland.enable = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    coreutils-full
    vim
    curl
    mesa
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
