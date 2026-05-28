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
    ]);
    # ++ (with pkgsUnstable; []);
}
