{ pkgs, ... }:
let
  iqbe-theme = builtins.fromJSON (builtins.readFile ../../iqbe-theme.json);
  iqbe-colors = iqbe-theme.colors;
  iqbe-fonts = iqbe-theme.fonts;
in
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

      colors = {
        primary = iqbe-colors.primary;
        cursor = iqbe-colors.cursor;
        normal = iqbe-colors.normal;
        bright = iqbe-colors.bright;
      };

      font = {
      	size = 15.0;
	normal = {
	  family = iqbe-fonts.fira-code.font-name;
	  style = iqbe-fonts.fira-code.variations.retina;
	};
	bold = {
	  family = iqbe-fonts.fira-code.font-name;
	  style = iqbe-fonts.fira-code.variations.bold;
	};
	italic = {
	  family = iqbe-fonts.fira-mono.font-name;
	  style = iqbe-fonts.fira-mono.variations.italic;
	};
      };
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    fira-mono
  ];
}
