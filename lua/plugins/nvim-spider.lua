return {
	"chrisgrieser/nvim-spider",
	main = "spider",
	lazy = true,
	keys = {
		{'w', ":lua require('spider').motion('w')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) Forward a word", silent = true},
		{'e', ":lua require('spider').motion('e')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) Forward to end of word", silent = true},
		{'b', ":lua require('spider').motion('b')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) Backward a word", silent = true},
		{"ge", ":lua require('spider').motion('ge')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) Backward to end of word", silent = true},
	},
	opts = {
		skipInsignificantPunctuation = false
	}
}
