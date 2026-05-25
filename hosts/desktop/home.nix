{ config, pkgs, pkgsUnstable, ... }:

{
  home.username = "iqbe";
  home.homeDirectory = "/home/iqbe";
  home.stateVersion = "25.11"; # Don't change!

  home.packages =
    (with pkgs; [
      vscode

      bottles
      prismlauncher

      gimp
      inkscape

      onlyoffice-desktopeditors
    ])

    ++ (with pkgsUnstable; [
      discord
      spotify
    ]);

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
