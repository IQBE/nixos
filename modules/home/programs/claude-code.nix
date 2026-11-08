{ pkgsUnstable, ... }:

{
  programs.claude-code = {
    enable = true;
    package = pkgsUnstable.claude-code;
    mcpServers.context7 = {
      type = "http";
      url = "https://mcp.context7.com/mcp/oauth";
    };
  };
}
