return {
    'Wansmer/treesj',
    keys = { { "<leader>m", function() require("treesj").toggle() end, desc = "Toggle (TSJ) block" }, },
    cmd = {"TSJToggle", "TSJSplit", "TSJJoin"},
    -- dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false, max_join_length = 9999}
}
