local opt = vim.opt
-- set <Leader> key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
opt.confirm = true
opt.completeopt = "menu,menuone"
-- relative line numbers
opt.relativenumber = true
opt.nu = true
-- use system clipboard
-- copy previous line's indent
opt.copyindent = true
opt.smartindent = true
-- highlight cursor column
opt.cursorcolumn = true
-- enable line highlight
opt.cursorline = true
-- set line to go across line and number
opt.cursorlineopt= "both"
-- ignore case in searches by default
opt.ignorecase = true
-- set how many spaces a tab makes (no expand tab means it will create a tab on 8)
opt.tabstop = 4
opt.expandtab = true
-- how many spaces >> inserts
opt.shiftwidth = 4
-- disable word wrap
opt.wrap = false

opt.list = true
opt.listchars:append "eol:$"

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8

opt.signcolumn = "yes"

opt.swapfile = false
opt.backup = false
---@diagnostic disable-next-line: assign-type-mismatch
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.splitright = true

vim.api.nvim_create_autocmd("TextYankPost", {
	command = ":silent! lua vim.highlight.on_yank({timeout=250})"
})

vim.api.nvim_create_user_command("CDC", "cd %:p:h", {})
