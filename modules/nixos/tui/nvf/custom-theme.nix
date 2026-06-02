{ ... }:

let
  iqbe-theme = builtins.fromJSON (builtins.readFile ../../../iqbe-theme.json);
  iqbe-colors = iqbe-theme.colors;
in
{
  programs.nvf.settings.vim.theme = {
    enable = true;
    name = "base16"; # Custom version of Bronokai
    transparent = true;
    base16-colors = {
      base00 = iqbe-colors.primary.background;
      base01 = "#303233"; # Derivation
      base02 = "#434445"; # Derivation
      base03 = iqbe-colors.normal.black;
      base04 = iqbe-colors.bright.black;
      base05 = iqbe-colors.primary.foreground;
      base06 = iqbe-colors.normal.white;
      base07 = iqbe-colors.bright.white;
      base08 = iqbe-colors.normal.red;
      base09 = iqbe-colors.normal.yellow;
      base0A = iqbe-colors.bright.yellow;
      base0B = iqbe-colors.normal.green;
      base0C = iqbe-colors.normal.cyan;
      base0D = iqbe-colors.normal.blue;
      base0E = iqbe-colors.normal.magenta;
      base0F = iqbe-colors.bright.red;
    };
  };
}
