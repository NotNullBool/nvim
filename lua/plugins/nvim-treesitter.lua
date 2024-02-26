return {{
    "nvim-treesitter/nvim-treesitter",
    version= false;
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
	opts = function()
        require 'nvim-treesitter.install'.prefer_git = false
        return {
            --enable syntax highlighting
            indent = {
                enable = true,
                disable = {"c_sharp"},
            },
            highlight = { enable = true },
            incremental_selection = {enable = true},
            endwise = { enable = true }
        }
    end
},{
		"RRethy/nvim-treesitter-endwise",
		event = "InsertEnter *.lua",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
}}
