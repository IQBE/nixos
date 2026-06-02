{ ... }:

{
  programs.nvf.config.vim = {
    keymaps = [
      # VIM
      {
        mode = "v";
        key = "<";
        silent = true;
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        silent = true;
        action = ">gv";
      }
      {
        mode = ["v" "n"];
        key = "<Leader>y";
        silent = true;
        action = ''"+y'';
      }
      {
        mode = "n";
        key = "<Leader>Y";
        silent = true;
        action = ''"+Y'';
      }
      {
        mode = ["v" "n"];
        key = "<Leader>p";
        silent = true;
        action = ''"+p'';
      }
      {
        mode = ["v" "n"];
        key = "<Leader>P";
        silent = true;
        action = ''"+P'';
      }
      {
        mode = "n";
        key = "<C-d>";
        silent = true;
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<C-u>";
        silent = true;
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "<C-f>";
        silent = true;
        action = "<C-f>zz";
      }
      {
        mode = "n";
        key = "<C-b>";
        silent = true;
        action = "<C-b>zz";
      }

      # Plugins
      {
        mode = "n";
        key = "<C-b>";
        silent = true;
        action = "<C-b>zz";
      }
    ];
  };
}
