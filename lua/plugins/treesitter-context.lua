return {
    "nvim-treesitter/nvim-treesitter-context",
	dependencies = "nvim-treesitter/nvim-treesitter",
	event = "UIEnter",
	config = function()
        vim.cmd('hi TreesitterContext guibg=none')
    end
}
