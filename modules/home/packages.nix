{ pkgs, pkgsUnstable, ... }:
{
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
}
