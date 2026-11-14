{ pkgs, pkgsUnstable, ... }:

{
  home.packages =
    (with pkgs; [
      filezilla

      bottles
      prismlauncher

      gimp
      inkscape
      freecad

      onlyoffice-desktopeditors
    ])
    ++ (with pkgsUnstable; [
      vscode
      discord
      spotify
      orca-slicer
    ]);
}
