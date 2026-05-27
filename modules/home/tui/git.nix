{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Ilya Quateau";
        email = "git@quateau.net";
        signingkey = "97C047EC0FE0A3F150E4CE39D27EA2E824BD4C5E";
      };

      signing = {
        format = "gpg";
        signByDefault = true;
      };

      core = {
        autocrlf = "input";
	safecrlf = false;
	whitespace = "warn,trailing-space,space-before-tab,tab-in-indent,cr-at-eol";
      };

      blame = {
        coloring = "highlightRecent";
        date = "relative";
      };

      status = {
        branch = true;
	short = true;
	showStash = true;
	showUntrackedFiles = "all";
      };

      push = {
        default = "current";
	gpgsign = "if-asked";
      };
      
      tag = {
        gpgsign = true;
        sort = "-taggerdate";
      };

      rebase = {
        autoStash = true;
	updateRefs = true;
      };

      alias = {
          lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
          deep-blame = "blame -C -C -C";
          wdiff = "diff --word-diff";
          blame = "blame -w";
      };

      fetch.writeCommitGraph = true;
      init.defaultBranch = "main";
      pager.diff = "less";
      commit.gpgsign = true;
      branch.sort = "-committerdate";
      rerere.enabled = true;
      color.ui = "auto";
    };
  };
}
