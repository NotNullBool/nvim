return{
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    dependencies = {
	"nvim-tree/nvim-web-devicons"
    },
    config = function()
	-- disable netrw at the very start of your init.lua
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

	-- OR setup with some options
	require("nvim-tree").setup({
	    --sort_by = "case_sensitive",
	    view = {
		width = 35,
		relativenumber = true,
	    },
	    renderer = {
		group_empty = true,
	    },
	    filters = {
		dotfiles = false,
	    },
	})

	local keymap = vim.keymap

	keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
	keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
	keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
	keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end
}
