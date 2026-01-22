local platform = require('utils.platform')()

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh' }
   options.launch_menu = {
      { label = 'PowerShell', args = { 'pwsh' } },
      { label = 'Windows PowerShell', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      {
         label = 'Git Bash',
         args = { 'C:\\Program Files\\Git\\bin\\bash.exe' },
      },
   }
else
   options.default_prog = { '/usr/local/bin/zsh','-1' }
end

return options
