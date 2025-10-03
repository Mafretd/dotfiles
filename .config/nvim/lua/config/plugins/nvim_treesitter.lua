-- Plugin: Nvim Treesitter configurations and abstraction layer.
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
        enabled = true,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@conditional.outer",
							["ic"] = "@conditional.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
						},
					},
				},
				ensure_installed = {
					"bash",
					"c",
					"css",
					"csv",
					"dockerfile",
					"gitignore",
					"go",
					"haskell",
					"html",
					"htmldjango",
					"java",
					"javascript",
					"jsdoc",
					"json",
					"lua",
					"luadoc",
					"markdown",
					"python",
					"sql",
					"tmux",
					"toml",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
				},
				auto_install = true,
			})
		end,
	},
}
