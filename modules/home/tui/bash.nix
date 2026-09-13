{ lib, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # History settings
    historySize = 10000;
    historyFileSize = 20000;
    historyControl = [ "ignoredups" ];
    historyIgnore = [ "&" "ls" "[bf]g" "exit" ];

    shellOptions = [
      "histappend"
      "cmdhist"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
    };

    shellAliases = {
      l = "ls -CF";
      la = "ls -AlCF";
      ll = "ls -AlFsh";
      lsd = "ll | grep";
      cls = "clear";
      "cd-" = "cd -";
      "cd.." = "cd ..";
      ".." = "cd ..";
      svim = "sudoedit";

      # Overrides
      free = "free -h";
      rm = "rm -Iv";
      cp = "cp -iv";
      mv = "mv -iv";
      vi = "nvim";
      vim = "nvim";
      ls = "ls --color=auto --group-directories-first";
      cd = "z";
      grep = "rg";
    };

    initExtra = lib.mkMerge [
      (''
      # Completion improvements
      bind 'set completion-ignore-case on'

      function jump {
        builtin cd "$@" && l
      }

      function mkdire {
        mkdir -p "$1" && jump "$1"
      }

      function sudoedit {
        sudo -e "$1"
      }

      # Custom function to get the current Git branch
      function __current_git_branch {
        # Check if the current directory is inside a Git repository
        if git rev-parse --is-inside-work-tree &>/dev/null; then
          # Get the current branch name
          branch=$(git symbolic-ref --short -q HEAD 2>/dev/null)
          if [ -n "$branch" ]; then
            echo "($branch)"
          else
            echo "(empty repo)"
          fi
        fi
      }

      # Beautify console
      function __setprompt {
        local BLUE="\[\033[0;96m\]"
        local GREEN="\[\033[0;92m\]"
        local MAGENTA="\[\033[0;95m\]"
        local YELLOW="\[\033[0;33m\]"
        local RED="\[\033[0;91m\]"
        local NO_COLOUR="\[\033[0m\]"
        local SSH_IP=$(echo $SSH_CLIENT | awk '{ print $1 }')
        local SSH2_IP=$(echo $SSH2_CLIENT | awk '{ print $1 }')
        if [ $SSH2_IP ] || [ $SSH_IP ] ; then
          local SSH_FLAG="@\h"
        fi
        PS1="$BLUE[\$(date +%H:%M)]$GREEN[\u$SSH_FLAG:$MAGENTA\w$GREEN]$YELLOW\$(__current_git_branch)$RED\$ $NO_COLOUR"
        PS2="$BLUE>$NO_COLOUR "
        PS4='$BLUE+$NO_COLOUR '
      }
      __setprompt
    '')

      # Runs after the zoxide integration (mkOrder 2000) so `z`/`zi` can be wrapped.
      (lib.mkOrder 2100 ''
      function z {
        __zoxide_z "$@" && l
      }

      function zi {
        __zoxide_zi "$@" && l
      }

      # Startup commands
      fastfetch
      l
    '')
    ];
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/bin"
  ];
}
