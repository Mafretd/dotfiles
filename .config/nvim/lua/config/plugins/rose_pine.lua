return {
	"rose-pine/neovim",
	name = "rose-pine",
	enabled = false,
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			styles = { italic = false },
			highlight_groups = {
				Comment = { italic = true },
--[[ 				Keyword = { bold = true },
				Conditional = { bold = true },
				["@keyword.conditional"] = { bold = true },
				["@keyword.import"] = { bold = true },
				["@keyword.return"] = { bold = true },
				["@keyword.repeat"] = { bold = true },
	 ]]		},
		})
		vim.cmd("colorscheme rose-pine-moon")
	end,
}
