{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;
    };
    settings.yazi = {
      mgr = {
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_dir_first = true;
        linemode = "mtime";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 10;
      };
      preview = {
        wrap = "yes";
        tab_size = 2;
      };
      input = {
        cursor_blink = false;
      };
    };
  };
}
