{ ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;
      lsp = {
        enable = true;
      };
    };
  };
}

# package = pkgsUnstable.neovim;
# 
# defaultEditor = true;
# viAlias = true;
# vimAlias = true;
# vimdiffAlias = true;
# 
# plugins = with pkgsUnstable.vimPlugins; [
# autoclose-nvim
# ];
