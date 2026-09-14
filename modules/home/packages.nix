{ pkgs, pkgsUnstable, ... }:

{
  home.packages =
    (with pkgs; [
      vscode
      filezilla

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
