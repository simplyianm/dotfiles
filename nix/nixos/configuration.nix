{ config, pkgs, ... }:

{
  imports = [ ./services ./users.nix ];

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
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  # Enable bluetooth.
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  hardware.keyboard.zsa.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?

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

    polybarFull
    pciutils
  ];

  time.timeZone = "America/Chicago";

  nix = {
    package = pkgs.nixUnstable;
    useSandbox = false;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
    trustedUsers = [ "root" "igm" ];
  };

  # keyring
  services.gnome.gnome-keyring.enable = true;
}
