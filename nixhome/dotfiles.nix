{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles/dotfiles";
  private-secrets = "${config.home.homeDirectory}/private_secrets/dotfiles";

  spacemacs = builtins.fetchGit {
    name = "spacemacs";
    url = "git://github.com/syl20bnr/spacemacs";
    ref = "develop";
    rev = "4b195ddfc9228256361e0b264fe974aa86ed51a8";
  };
in {
  home.file.".gitconfig".source = "${dotfiles}/gitconfig";
  home.file.".spacemacs".source = "${dotfiles}/spacemacs";

  home.file.".vimrc".source = "${dotfiles}/vimrc";
  home.file.".vim" = {
    source = "${dotfiles}/vim";
    recursive = true;
  };

  home.file.".emacs.d" = {
    source = spacemacs;
    recursive = true;
  };

  home.file.".vim/bundle/Vundle.vim" = {
    source = builtins.fetchGit {
      name = "vundle";
      url = "git://github.com/VundleVim/Vundle.vim";
      ref = "master";
      rev = "9a38216a1c0c597f978d73547d37681fc689c90d";
    };
    recursive = true;
  };

  home.file.".sbt" = {
    source = "${dotfiles}/sbt";
    recursive = true;
  };

  home.file.".sbt/1.0/repositories" = {
    source = "${private-secrets}/sbt/repositories";
  };

  home.file.".sbt/1.0/.credentials" = {
    source = "${private-secrets}/sbt/credentials";
  };

  home.file.".sbt/1.0/linux.sbt".source =
    "${dotfiles}/sbt/1.0/global.sbt" + (if (!pkgs.stdenv.isDarwin) then ".linux" else "");

  home.file.".sbt/1.0/sonatype.sbt".source = "${private-secrets}/sonatype.sbt";

  home.file.".config/coursier" = {
    source = "${private-secrets}/coursier";
    recursive = true;
  };

  home.file.".aws" = {
    source = "${private-secrets}/aws";
    recursive = true;
  };

  home.file.".kube" = {
    source = "${private-secrets}/kube";
    recursive = true;
  };

  # home.file.".jx" = {
  #   source = "${private-secrets}/jx";
  #   recursive = true;
  # };

  home.file.".npmrc".source =  "${private-secrets}/npmrc";

  home.file.".tmux.conf" = {
    source = if (pkgs.stdenv.isDarwin) then
      "${dotfiles}/tmux/tmux_mac.conf"
    else
      "${dotfiles}/tmux/linux.conf";
  };

  home.file.".xscreensaver".source = "${dotfiles}/xscreensaver";
  home.file.".xsession".source = "${dotfiles}/xsession";

  home.file.".config/fcitx" = {
    source = "${dotfiles}/fcitx";
    recursive = true;
  };
}
