{ pkgs, pkgsUnstable, ... }:

let
  # Orca Slicer flickers on GNOME Wayland with the proprietary NVIDIA driver.
  # Force XWayland, disable NVIDIA threaded GL and WebKit's DMA-BUF renderer.
  orca-slicer = pkgs.symlinkJoin {
    name = "orca-slicer-wrapped";
    paths = [ pkgsUnstable.orca-slicer ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/orca-slicer \
        --set GDK_BACKEND x11 \
        --set __GL_THREADED_OPTIMIZATIONS 0 \
        --set WEBKIT_DISABLE_DMABUF_RENDERER 1
    '';
  };
in
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
    ])
    ++ [ orca-slicer ];
}
