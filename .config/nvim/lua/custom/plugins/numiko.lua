return {
	-- Emmet support
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "javascript", "typescript", "vue", "php", "twig" },
		config = function()
			vim.g.user_emmet_settings = {
				postcss = { extends = "css" },
				twig = { extends = "html" },
			}
		end,
	},

	-- PostCSS syntax
	{
		"stephenway/postcss.vim",
	},

	-- Twig syntax for Drupal
	{
		"lumiliet/vim-twig",
	},

	-- Package version display
	{
		"vuki656/package-info.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		ft = "json",
		config = function()
			require("package-info").setup()
		end,
	},

	-- Tailwind CSS folding and highlighting
	{
		"razak17/tailwind-fold.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "twig" },
	},
}
