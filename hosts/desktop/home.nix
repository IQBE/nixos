{ config, pkgs, pkgsUnstable, self, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.username = "iqbe";
  home.homeDirectory = "/home/iqbe";
  home.stateVersion = "25.11"; # Don't change!


  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
