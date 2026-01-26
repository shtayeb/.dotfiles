-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- better up/down
-- map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })

map("i", "jk", "<Esc>", { noremap = true })
map("v", "jk", "<Esc>", { noremap = true })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
