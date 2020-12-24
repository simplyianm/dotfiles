{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];
  environment.systemPackages = with pkgs; [ vim kitty tor ];

  home-manager.users.igm = import ../home;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  nix.package = pkgs.nix;

  programs.bash.enable = true;
  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      if [ $TERM = xterm-kitty ]; then
        export TERMINFO="${pkgs.kitty}/Applications/kitty.app/Contents/Resources/kitty/terminfo";
      fi
    '';
    variables = { EDITOR = "${pkgs.vim}/bin/vim"; };
  };

  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    extraConfig = builtins.readFile ./static/yabairc;
  };

  services.lorri.enable = true;

  programs.gnupg = { agent.enable = true; };

  users.users.igm = {
    name = "Ian Macalinao";
    home = "/Users/igm";
  };

  launchd.user.agents.tor = {
    command = with pkgs; "${tor}/bin/tor";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      ProcessType = "Background";
      StandardOutPath = "/var/tmp/tor.log";
      StandardErrorPath = "/var/tmp/tor.error.log";
    };
  };
}
