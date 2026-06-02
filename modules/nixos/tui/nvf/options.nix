{ ... }:

{
  programs.nvf.settings.vim.options = {
    autoindent = true;
    smartindent = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    mouse = "v";
    termguicolors = true;
    wrap = false;
    incsearch = true;
    list = true;
    listchars = "space:·,tab:→ ,trail:~,extends:>,precedes:<";
    scrolloff = 10;
  };
}
