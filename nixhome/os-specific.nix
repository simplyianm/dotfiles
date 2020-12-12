{ config, pkgs, lib, ... }:

lib.mkMerge [
  (lib.mkIf pkgs.stdenv.isLinux {
    xsession.enable = true;
    xsession.profileExtra = "$HOME/dotfiles/bin/desktop_monitors.sh";

    xsession.windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ../dotfiles/xmonad/xmonad.hs;
    };

    home.packages = with pkgs; [
      # random
      glxinfo

      # Browsers
      brave
      chromium
      firefox
      google-chrome

      # Media
      spotify
      vlc

      # Comms
      discord
      signal-desktop
      tdesktop
      slack
      zoom-us

      # Developer
      hyper
      insomnia
      postman

      # Etc
      rofi
      rofi-systemd

      # Video
      ffmpeg
      libreoffice

      # games
      # factorio
      minecraft
      openttd

      image_optim
      keybase-gui
      ledger-live-desktop

      xclip
      xsel
    ];

    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 24 * 60 * 60;
      maxCacheTtl = 24 * 60 * 60;
      enableSshSupport = true;
    };

    services.xscreensaver.enable = true;
  })

  (lib.mkIf pkgs.stdenv.isDarwin {
    home.packages = with pkgs; [
      reattach-to-user-namespace
      pinentry_mac
      gnupg
    ];

    home.file.".gnupg/gpg-agent.conf" = {
      text =
        "pinentry-program ${pkgs.pinentry_mac}/${pkgs.pinentry_mac.passthru.binaryPath}";
    };
  })
]
