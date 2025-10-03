-- Plugin: A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				always_divide_middle = false,
				globalstatus = true,
				theme = "auto",
				icons_enabled = true,
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_b = {
					{ "branch", icon = { "" } },
					{
						"diff",
						symbols = {
							added = "+",
							modified = "~",
							removed = "-",
						},
					},
					--{ "buffers", show_filename_only = true, use_mode_colors = true },
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "nvim_lsp", "coc" },
						section = { "error", "warn", "info", "hint" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_c = {
					--[[ {
						"filetype",
						colored = true,
						icon_only = true,
						icon = { align = "left" },
						padding = { left = 1, rigth = 0 },
					}, ]]
					{ "filename", newfile_status = true, path = 0, padding = { left = 1, rigth = 1 } },
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
					},
					{ "encoding", fmt = string.lower },
					{ "fileformat", icons_enabled = false, fmt = string.lower },
				},
			},

			inactive_winbar = {
				lualine_c = { "filename" },
			},
		})
	end,
}
