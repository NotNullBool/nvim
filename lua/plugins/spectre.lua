return {
	"nvim-pack/nvim-spectre",
	-- enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {open_cmd = "noswapfile vnew"},
	keys = {
		{ "<leader>lsr", function () require("spectre").open() end, desc = "Replace in files (Spectre)"}
	}
}
