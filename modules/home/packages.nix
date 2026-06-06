{ pkgs, pkgsUnstable, ... }:

{
  home.packages =
    (with pkgs; [
      vscode

      bottles
      prismlauncher

      gimp
      inkscape
      freecad

      onlyoffice-desktopeditors
    ])
    ++ (with pkgsUnstable; [
      discord
      spotify
    ]);
}
