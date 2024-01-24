vim.opt.colorcolumn = "80"
-- vim.o.shell = "pwsh"

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap=true})
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', {noremap=true})

-- vim.keymap.set('i', 'jk', '<Esc>', {noremap=true})
-- vim.keymap.set('v', 'jk', '<Esc>', {noremap=true})
-- vim.loop.os_uname().sysname == "Windows_NT"

vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)


vim.filetype.add({ extension = { templ = "templ" } })

local getOs = function()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		Osname = fh:read()
	end

	return Osname or "Windows"
end

if getOs() == "Windows" then 
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end



