{ config, pkgs, inputs, ... }: {
  imports =
    [ ./hardware-configuration.nix inputs.home-manager.nixosModules.default ];

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # cinnamon
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  #services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.opengl.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # services.xserver.libinput.enable = true;

  programs.zsh.enable = true;

  users.users.jay = {
    isNormalUser = true;
    description = "Jay Baker";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ firefox ];
  };
  security.sudo.wheelNeedsPassword = false;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "jay" = import ./home.nix; };
  };

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    git
    gcc
    python3
    tmux
    zsh
    neovim
    wget
    alacritty
    bat
    rsync
    eza
    bat
    htop
    waybar
    dunst
    libnotify
    swww
    networkmanagerapplet
    pavucontrol
    feh
    w3m
    playerctl
    wl-clipboard
    usbutils
    gnupg
    pinentry-curses
    parted
    gparted
    rpi-imager
    iotop
    cifs-utils
    samba
  ];

  security.polkit.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };
  services.pcscd.enable = true;
  xdg.portal = { enable = true; };

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
}
