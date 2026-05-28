{ pkgs, pkgsUnstable, ... }:

{
  programs = {
    gnupg.agent.enable = true;

    firefox.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgsUnstable; [
        proton-ge-bin
      ];
    };

    gamemode.enable = true;
  };
}
