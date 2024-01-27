vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>s", mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
    { "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "<leader>r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<leader>R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }

},{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},{
	"nvim-treesitter/nvim-treesitter-textobjects",
	version = false,
	build = ":TSUpdate",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- you can use the capture groups defined in textobjects.scm
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },

						["a:"] = { query = "@parameter.outer", desc = "Select outer part of an parameter/field region" },
						["i:"] = { query = "@parameter.inner", desc = "Select inner part of an parameter/field region" },

						["ai"] = { query = "@conditional.outer", desc = "Select outer part of an conditional region" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of an conditional region" },

						["al"] = { query = "@loop.outer", desc = "Select outer part of an loop region" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of an loop region" },

						["ab"] = { query = "@block.outer", desc = "Select outer part of an block region" },
						["ib"] = { query = "@block.inner", desc = "Select inner part of an block region" }, -- overrides default text object block of parenthesis to parenthesis

						["af"] = { query = "@function.outer", desc = "Select outer part of an function region" },
						["if"] = { query = "@function.inner", desc = "Select inner part of an function region" },

						["ac"] = { query = "@class.outer", desc = "Select outer part of an class region" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of an class region" },
					},
					include_surrouding_whitespace = true,
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>on"] = "@parameter.inner", --swap object under cursor with next
					},
					swap_previous = {
						["<leader>op"] = "@parameter.inner", --swap object under cursor with previous
					},
				},
			},
		})

	end,
},
{
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = { auto_install = true }
}, {
    'Wansmer/treesj',
    keys = { { "<leader>m", function() require("treesj").toggle() end, desc = "Toggle TSJ block" } },
    cmd = {"TSJToggle", "TSJSplit", "TSJJoin"},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false }
} })

local keymap = vim.keymap

-- Folding
keymap.set({ 'n', 'x' }, "za", ":call VSCodeNotify('editor.toggleFold')<CR>", { silent = true })
keymap.set({ 'n', 'x' }, "zO", ":call VSCodeNotify('editor.unfoldRecursively')<CR>", { silent = true })
keymap.set({ 'n', 'x' }, "zo", ":call VSCodeNotify('editor.unfold')<CR>", { silent = true })
keymap.set({ 'n', 'x' }, "zC", ":call VSCodeNotify('editor.foldRecursively')<CR>", { silent = true })
keymap.set({ 'n', 'x' }, "zc", ":call VSCodeNotify('editor.fold')<CR>", { silent = true })
keymap.set({ 'n', 'x' }, "zR", ":call VSCodeNotify('editor.unfoldAll')<CR>", { silent = true })
keymap.set({ 'n', 'x' }, "zM", ":call VSCodeNotify('editor.foldAll')<CR>", { silent = true })

-- Comment
keymap.set({'n','x','o'}, "gc", ":VSCodeCommentary<CR>", {silent = true})

keymap.set({'v','n'}, "<leader>d", "\"_d",{ desc = "Void delete"})

keymap.set({'v','n'}, "<leader>y", "\"+y",{ desc = "Yank to clipboard" })
keymap.set({'v','n'}, "<leader>y", "\"+y",{ desc = "Yank to clipboard" })

keymap.set('n', "<leader>p", "\"+p", {desc = "Paste from clipboard"})
keymap.set('n', "<leader>P", "\"+P", {desc = "Paste from clipboard"})

keymap.set('', ';', ':')
keymap.set('', ':', ';')

-- keymap.set({'n','x'}, ",", ":call VSCodeNotify('whichkey.show')<CR>", {silent = true})
keymap.set('n', "<leader>a", "mzJ`z", {desc = "Append next line", silent = true})
vim.opt.hlsearch = false

keymap.set('n', '<C-j>', ":m .+1<CR> ==",{ desc = "Line down", silent = true})
keymap.set('n', '<C-k>', ":m .-2<CR> ==",{ desc = "Line up", silent = true})

keymap.set('x', '<C-k>', ":m '<-2<CR>gv=gv",{ desc = "Line up", silent = true})
keymap.set('x', '<C-j>', ":m '>+1<CR>gv=gv",{ desc= "Line down", silent = true})

vim.api.nvim_create_autocmd("TextYankPost", {
	command = ":silent! lua vim.highlight.on_yank({timeout=250})"
})

-- Skip over folds in vscode
local function moveCursor(direction)
    if (vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '') then
        return ('g' .. direction)
    else
        return direction
    end
end

vim.keymap.set('n', 'k', function()
    return moveCursor('k')
end, { expr = true, remap = true })
vim.keymap.set('n', 'j', function()
    return moveCursor('j')
end, { expr = true, remap = true })
