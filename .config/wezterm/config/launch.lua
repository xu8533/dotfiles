local platform = require("utils.platform")()

local options = {
  default_prog = {},
  launch_menu = {},
}
if platform.is_linux then
  options.default_prog = { "bash", "-l" }
  options.launch_menu = {
    { label = "Bash", args = { "bash", "-l" } },
    { label = "Fish", args = { "fish", "-l" } },
    { label = "Zsh",  args = { "zsh", "-l" } },
  }
elseif platform.is_win then
  options.default_prog = { "pwsh.exe" }
  options.launch_menu = {
    { label = " PowerShell v1", args = { "powershell" } },
    { label = " PowerShell v7", args = { "pwsh.exe" } },
    { label = " Cmd", args = { "cmd" } },
    { label = " Nushell", args = { "nu" } },
    {
      label = " GitBash",
      args = { "C:\\soft\\Git\\bin\\bash.exe" },
    },
    {
      label = " AlmaLinux",
      args = { "ssh", "kali@192.168.44.147", "-p", "22" },
    },
  }
elseif platform.is_mac then
  options.default_prog = { "/opt/homebrew/bin/fish" }
  options.launch_menu = {
    { label = " Bash", args = { "bash" } },
    { label = " Fish", args = { "/opt/homebrew/bin/fish" } },
    { label = " Nushell", args = { "/opt/homebrew/bin/nu" } },
    { label = " Zsh", args = { "zsh" } },
  }
end

return options
