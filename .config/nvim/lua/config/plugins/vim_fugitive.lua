-- Plugin: Git integration
-- https://github.com/tpope/vim-fugitive/

return {
	"tpope/vim-fugitive",
	cmd = { "G", "Git" },
	keys = {
		{ "<leader>gs", ":Git status<CR>", desc = "Git status" },
		{ "<leader>gd", ":Ghdiffsplit<CR>", desc = "Git diff" },
		{ "<leader>gp", ":Git push<CR>", desc = "Git push" },
	},
}
