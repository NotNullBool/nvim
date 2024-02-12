return {
    "ThePrimeagen/harpoon",
    keys = {
        {"<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle Harpoon Menu"},
        {"<leader>ha", "<cmd>lua require('harpoon.ui').add_file()<CR>", desc = "Harpoon Add File"},
    },
    config = true,
}
