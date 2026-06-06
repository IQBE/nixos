{ pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages =
    (with pkgs; [
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
      ffmpeg
      poppler
      fd
      ripgrep
      resvg
      _7zz-rar
    ]);
    # ++ (with pkgsUnstable; []);
}
