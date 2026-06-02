{ ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      # Plugins
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      languages = {
        bash.enable = true;
        css.enable = true;
        docker.enable = true;
        html.enable = true;
        java.enable = true;
        json.enable = true;
        lua.enable = true;
        nix.enable = true;
        python.enable = true;
        rust.enable = true;
        scss.enable = true;
        sql.enable = true;
        toml.enable = true;
        tsx.enable = true;
        typescript.enable = true;
        xml.enable = true;
        yaml.enable = true;
      };

      lsp = {
        enable = true;
      };
    };
  };
}
