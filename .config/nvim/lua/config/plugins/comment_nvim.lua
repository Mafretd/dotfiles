-- Plugin: Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more.
-- https://github.com/numToStr/Comment.nvim

return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup()
	end,
}
