-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- My plugins
	{
		"shtayeb/nvim-django-shell",
		opts = {
			name = "Max"
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			-- require("tokyodark").setup(opts) -- calling setup is optional
			-- vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- your optional config goes here, see below.
			vim.cmd.colorscheme("bluloco-dark")
		end,
	},

	{
		"tpope/vim-fugitive",
	},
	{
		"github/copilot.vim",
	},
	{
		"rebelot/kanagawa.nvim",
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			-- vim.cmd.colorscheme("kanagawa")

			-- You can configure highlights by doing something like
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = {
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				adaptive_size = false,
				side = "left",
				width = 30,
				preserve_window_proportions = true,
			},
			git = {
				enable = true,
				ignore = false,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				root_folder_label = false,
				highlight_git = false,
				highlight_opened_files = "none",

				indent_markers = {
					enable = true,
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},

					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		},
		config = function(_, opts)
			-- dofile(vim.g.base46_cache .. "nvimtree")
			require("nvim-tree").setup(opts)
			-- nvimtree
			vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
			vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })
		end,
	},
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	opts = {
	-- 		fast_wrap = {},
	-- 		disable_filetype = { "TelescopePrompt", "vim" },
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("nvim-autopairs").setup(opts)

	-- 		-- setup cmp for autopairs
	-- 		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	-- 		require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
	-- 	end,
	-- },
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
	{
		"joerdav/templ.vim",
	},
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
