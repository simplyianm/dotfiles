{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ./services ];

  networking.hostName = "ianix";

  networking.extraHosts = ''
    127.0.0.1 local.pipe-dev.com
  '';

  console = {
    keyMap = "us";
    font = "Lat2-Terminus16";
  };

  i18n = { defaultLocale = "en_US.UTF-8"; };

  fonts.fonts = with pkgs; [
    dina-font
    fira-code
    fira-code-symbols
    google-fonts
    liberation_ttf
    mplus-outline-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
  ];

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "igm" ];

  fonts.fontconfig.dpi = 96;

  # This enables "fcitx" as your IME.  This is an easy-to-use IME.  It supports many different input methods.
  i18n.inputMethod.enabled = "fcitx";

  # This enables "mozc" as an input method in "fcitx".  This has a relatively
  # complete dictionary.  I recommend it for Japanese input.
  i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ mozc hangul ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    zsh

    # Other
    gnupg
    xclip

    # Build
    binutils
    gcc
    gnumake

    xscreensaver
    tmux
  ];

  time.timeZone = "America/Los_Angeles";

  users = {
    extraUsers = {
      igm = {
        name = "igm";
        uid = 1001;
        home = "/home/igm";
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" "transmission" ];
      };
      sinai = {
        name = "sinai";
        home = "/home/sinai";
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
      nginx = { extraGroups = [ "transmission" ]; };
      plex = { extraGroups = [ "transmission" ]; };
    };
  };

  home-manager.users.igm = import ../home;

  nixpkgs.config.pulseaudio = true;

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
}