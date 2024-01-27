return {
	"AckslD/muren.nvim",
	enabled = false,
	cmd = {
		"MurenToggle",
		"MurenOpen",
		"MurenClose",
		"MurenFresh",
		"MurenUnique"
	},
	keys = {{ "<leader>lmr", function() require("muren.api").toggle_ui() end, desc= "(Muren) search and replace"}},
	config = true
}
