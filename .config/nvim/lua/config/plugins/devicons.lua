-- Plugin: vim-web-devicons for neovim.
-- https://github.com/nvim-tree/nvim-web-devicons

return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			colors_icons = true,
			default = true,
			variant = "dark",
		})
	end,
}
