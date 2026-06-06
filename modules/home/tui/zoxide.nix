{ ... }:

{
  programs.bash.enable = true;
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };
}
