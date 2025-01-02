-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- My plugins
	{
		dir = "~/Code/django-projects/nvim-django-shell",
		opts = {},
	},

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
				follow_current_file = true,
			},
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
			vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Nvimtree Toggle window" })
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd([[colorscheme rose-pine-moon]])
		end,
	},
	{ "tiagovla/tokyodark.nvim" },
	{ "tpope/vim-fugitive" },
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = true,
		opts = { mode = "cursor" },
		keys = {
			{
				"<leader>ut",
				function()
					local tsc = require("treesitter-context")
					tsc.toggle()
				end,
				desc = "Toggle Treesitter Context",
			},
		},
	},
	{ "joerdav/templ.vim" },
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}
