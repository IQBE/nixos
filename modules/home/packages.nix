{ pkgs, pkgsUnstable, ... }:
{
  home.packages =
    (with pkgs; [
      neovim
      tmux
      tree
      tealdeer
      fastfetch
      zip
      unzip
      p7zip
      gnutar
      jq
      fzf
      curl
      gnupg

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
}
