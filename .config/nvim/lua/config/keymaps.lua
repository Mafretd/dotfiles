local opts = { noremap = true, silent = true }

vim.g.mapleader = ","

local keymap = vim.keymap -- Shorten function name

-- General keymaps

-- NORMAL MODE

keymap.set("n", "<leader><leader>x", ":source %<CR>", opts) --Source current file

keymap.set("n", "<leader>w", "$") -- Move to the end of the line

-- Split and navigate buffers
keymap.set("n", "<Space>sv", "<C-w>v") -- Vertical split
keymap.set("n", "<Space>sh", "<C-w>s") -- Horizontal split
keymap.set("n", "<C-h>", "<C-w>h") -- Move left
keymap.set("n", "<C-l>", "<C-w>l") -- Move right
keymap.set("n", "<C-j>", "<C-w>j") -- Move down
keymap.set("n", "<C-k>", "<C-w>k") -- Move up
keymap.set("n", "<Space>q", ":close<CR>", opts) -- Close split
keymap.set("n", "<S-l>", ":bnext<CR>", opts) -- Move to the next buffer
keymap.set("n", "<S-h>", ":bprevious<CR>", opts) -- Move to the previous buffer

-- Disable search highlight
keymap.set("n", "<leader>m", ":nohl<CR><C-l>", opts)

-- Rezise buffers
keymap.set("n", "<S-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<S-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap.set("n", "<A-j>", ":m .+1<CR>", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>", opts)

-- File explorers
keymap.set("n", "<leader>e", ":Ex<CR>", opts)
keymap.set("n", "<leader>l", ":Lex 20<CR>", opts)

-- Retain the yank cursor position after paste
keymap.set("n", "<leader>y", "mM yy `M", opts)
keymap.set("n", "<leader>p", "mMP`[V`]=`M", opts)

-- VISUAL MODE

-- Exit visual mode
keymap.set("v", "<leader>", "<Esc>")

-- Retain visual block selection after indent
keymap.set("v", "<", "<gv^", opts)
keymap.set("v", ">", ">gv^", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "p", '"_dP', opts)

-- Exit insert mode
keymap.set("i", "<Space><leader>", "<Esc>")
