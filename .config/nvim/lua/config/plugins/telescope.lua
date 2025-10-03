-- Plugin: Highly extendable fuzzy finder over lists.
-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			file_browser = {
				hijack_netrw = true,
				follow_symlinks = true,
			},
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local action_layout = require("telescope.actions.layout")

		telescope.setup({
			defaults = {
				initial_mode = "normal",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						mirror = false,
						preview_cutoff = 0,
					},
				},
				preview = true,
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
					},
					n = { ["<C-c>"] = actions.close },
				},
			},
			pickers = {
				git_files = { show_untracked = true },
			},

			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		})
		telescope.load_extension("fzf")
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find git files" })
		keymap.set(
			"n",
			"<leader>fu",
			"<cmd>Telescope buffers<cr>",
			{ desc = "List open buffers in current neovim instance" }
		)
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			{ desc = "telescope-file-browser" }
		)
	end,
}
