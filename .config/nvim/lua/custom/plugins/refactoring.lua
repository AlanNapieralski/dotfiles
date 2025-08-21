return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	opts = {},
	init = function()
		-------------------------------------------------------------------
		-- Custom React Component Extraction
		-------------------------------------------------------------------
		local function extract_react_component()
			local bufnr = vim.api.nvim_get_current_buf()
			local refactor = require("refactoring")

			-- Get selected text
			local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(bufnr, "<"))
			local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(bufnr, ">"))
			local lines = vim.api.nvim_buf_get_lines(bufnr, start_row - 1, end_row, false)

			-- Adjust first and last line based on selection columns
			if #lines > 0 then
				lines[1] = string.sub(lines[1], start_col + 1)
				lines[#lines] = string.sub(lines[#lines], 1, end_col)
			end

			-- Prompt for component name
			local component_name = vim.fn.input("Component name: ")
			if component_name == "" then
				print("Cancelled: no name given")
				return
			end

			-- Replace selection with component usage
			vim.api.nvim_buf_set_lines(bufnr, start_row - 1, end_row, false, {
				string.format("<%s />", component_name),
			})

			-- Build the component code
			local component_code = {}
			table.insert(component_code, "")
			table.insert(component_code, string.format("const %s = () => {", component_name))
			table.insert(component_code, "  return (")
			for _, l in ipairs(lines) do
				table.insert(component_code, "    " .. l)
			end
			table.insert(component_code, "  );")
			table.insert(component_code, "};")
			table.insert(component_code, "")

			-- Insert at bottom of file
			vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, component_code)
			print(string.format("Extracted React component: %s", component_name))
		end

		-- Map it in visual mode only
		vim.keymap.set("x", "<leader>rc", extract_react_component, { desc = "Extract to React Component" })
	end,
}
