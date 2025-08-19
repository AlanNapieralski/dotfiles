return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			"~/Developer/*",
		},
	},
	init = function()
		-- Enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- Save global variables that start with an uppercase letter and contain at least one lowercase letter.

		-- Map the custom discover function to a keybinding
		vim.keymap.set("n", "<leader>p", "<CMD>Telescope neovim-project discover<CR>")
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
