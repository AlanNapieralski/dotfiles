return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	config = function()
		vim.keymap.set(
			"n",
			"<C-h>",
			"<CMD>TmuxNavigateLeft<CR>",
			{ desc = "Move focus to the left window", noremap = true }
		)
		vim.keymap.set(
			"n",
			"<C-j>",
			"<CMD>TmuxNavigateDown<CR>",
			{ desc = "Move focus to the lower window", noremap = true }
		)
		vim.keymap.set(
			"n",
			"<C-k>",
			"<CMD>TmuxNavigateUp<CR>",
			{ desc = "Move focus to the upper window", noremap = true }
		)
		vim.keymap.set(
			"n",
			"<C-l>",
			"<CMD>TmuxNavigateRight<CR>",
			{ desc = "Move focus to the right window", noremap = true }
		)
	end,
}
