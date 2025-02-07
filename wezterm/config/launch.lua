local platform = require('utils.platform')()
local wezterm = require('wezterm')
local act = wezterm.action

wezterm.on('window-config-reloaded', function(window, pane)
   -- start in fullscreen
   window:perform_action(act.ToggleFullScreen, pane)
end)

enable_kitty_keyboard = true

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh', '-NoLogo' }
   options.launch_menu = {
      { label = 'PowerShell Core',    args = { 'pwsh', '-NoLogo' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt',     args = { 'cmd' } },
      {
         label = 'Git Bash',
         args = { 'C:\\Users\\sparl\\scoop\\apps\\git\\current\\bin\\bash.exe' },
      },
   }
elseif platform.is_linux then
   options.default_prog = { 'bash', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Zsh',  args = { 'zsh', '-l' } },
   }
end

return options
