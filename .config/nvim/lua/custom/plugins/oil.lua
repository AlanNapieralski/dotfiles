return {
	"stevearc/oil.nvim",
	opts = {},
	config = function()
		local oil = require("oil")
		oil.setup({
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
		})

		vim.keymap.set("n", "<leader>bl", "<CMD>Oil --float<CR>")
		vim.keymap.set("n", "<leader>bs", function()
			local pwd = vim.fn.getcwd()
			vim.cmd("Oil --float " .. pwd)
		end)
	end,
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
