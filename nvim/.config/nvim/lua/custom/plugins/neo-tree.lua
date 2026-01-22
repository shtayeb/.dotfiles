return {

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			sources = {
				"filesystem",
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_gitignored = false,
					hide_dotfiles = false,
				},
				follow_current_file = {
					enabled = true,
				},
			},
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
			vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Nvimtree Toggle window" })
		end,
	},
}
