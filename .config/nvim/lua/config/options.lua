-- Basic vim config

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.
opt.sidescrolloff = 8 -- Minimal number of screen lines to keep left and right of the cursor.

opt.guicursor = "n-v-i-c:block-Cursor"

opt.showmode = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- Pop up menu height
opt.pumheight = 10

-- Cursor
opt.cursorline = true

-- Virtual Edit
opt.virtualedit = "block"

-- Tabs and indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.linebreak = true

-- Smartcase to avoid search errors
opt.smartcase = true
opt.ignorecase = true

-- Buffers split
opt.splitbelow = true
opt.splitright = true

-- Allow mouse interaction
opt.mouse = "a"

-- Backup files
opt.swapfile = false
opt.backup = false

opt.signcolumn = "yes"

-- Colors
opt.termguicolors = true

opt.confirm = true

opt.iskeyword:append("-")

opt.inccommand = "split"
