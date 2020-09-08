{ config, lib, pkgs, ... }:

{
  imports = [
    ./nginx.nix
    # ./pia.nix
    ./postgres.nix
    # ./transmission.nix
  ];

  services.autorandr = {
    enable = true;
    defaultTarget = "main";
  };

  services.kbfs = {
    enable = true;
    mountPoint = "%t/kbfs";
    extraFlags = [ "-label %u" ];
  };

  services.keybase = {
    enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.redis = {
    enable = true;
  };

  services.xserver = {
    enable = true;
    # displayManager.startx.enable = true;
    dpi = 96;

    xkbOptions = "caps:swapescape";
    desktopManager = {
      default = "xfce";
      xterm.enable = false;
      xfce = {
        enable = true;
      };
    };
  };

  # Yubikey
  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];

  virtualisation.docker.enable = true;
}
