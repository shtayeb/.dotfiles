return {
	{ "Yazeed1s/minimal.nvim" },
	{
		"Tsuzat/NeoSolarized.nvim",
		-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
		-- priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	vim.cmd([[ colorscheme NeoSolarized ]])
		-- end,
	},
	{ "rockerBOO/boo-colorscheme-nvim" },
	{
		"rose-pine/neovim",
		config = function()
			vim.cmd([[colorscheme rose-pine-moon]])
		end,
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{ "tiagovla/tokyodark.nvim" },
	{
		"rebelot/kanagawa.nvim",
		lazy = true, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
}
