{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      general.live_config_reload = true;
      selection.save_to_clipboard = true;
      scrolling.history = 2000;

      window = {
        dynamic_title = true;
        opacity = 0.85;
        startup_mode = "Maximized";
      };

      font.size = 15.0;
      font.normal.family = "FiraCode Nerd Font Mono";
      font.normal.style = "Retina";
      font.bold.family = "FiraCode Nerd Font Mono";
      font.bold.style = "Bold";
      font.italic.family = "FiraMono";
      font.italic.style = "Medium Italic";
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    fira-mono
  ];
}
