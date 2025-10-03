local M = {
	"catppuccin/nvim",
	enabled = true,
	name = "catppuccin",
	priority = 1000,
}

M.config = function()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = { dark = "mocha" },
		term_colors = true,
		show_end_of_buffer = true,
		styles = {
			comments = { "italic" },
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		integrations = {
			gitsigns = true,
			treesitter = true,
			coc_nvim = true,
			neotree = true,
			nvim_surround = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
					ok = { "undercurl" },
				},
			},
		},
		highlight_overrides = {
			all = function(colors)
				return {
					["@module"] = { style = { "italic" } },
					["@module.builtin"] = { style = { "italic" } },
				}
			end,
		},
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
