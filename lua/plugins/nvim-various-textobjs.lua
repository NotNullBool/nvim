return {
	"chrisgrieser/nvim-various-textobjs",
	keys ={

		{"iR", "<cmd>lua require('various-textobjs').restOfIndentation()<CR>", mode = { "o", "x" }},

		{"ig", "<cmd>lua require('various-textobjs').greedyOuterIndentation('inner')<CR>", mode = { "o", "x" }},
		{"ag", "<cmd>lua require('various-textobjs').greedyOuterIndentation('outer')<CR>", mode = { "o", "x" }},

		{"iS", "<cmd>lua require('various-textobjs').subword('inner')<CR>", mode = { "o", "x" }},
		{"aS", "<cmd>lua require('various-textobjs').subword('outer')<CR>", mode = { "o", "x" }},

		{"C", "<cmd>lua require('various-textobjs').toNextClosingBracket()<CR>", mode = { "o", "x" }},

		{"Q", "<cmd>lua require('various-textobjs').toNextQuotationMark()<CR>", mode = { "o", "x" }},

		{"pr", "<cmd>lua require('various-textobjs').restOfParagraph()<CR>", mode = { "o", "x" }},

		{"gG", "<cmd>lua require('various-textobjs').entireBuffer()<CR>", mode = { "o", "x" }},

		{"n", "<cmd>lua require('various-textobjs').nearEoL()<CR>", mode = { "o", "x" }},

		{"i_", "<cmd>lua require('various-textobjs').lineCharacterwise('inner')<CR>", mode = { "o", "x" }},
		{"a_", "<cmd>lua require('various-textobjs').lineCharacterwise('outer')<CR>", mode = { "o", "x" }},

		{"|", "<cmd>lua require('various-textobjs').column()<CR>", mode = { "o", "x" }},

		{"iv", "<cmd>lua require('various-textobjs').value('inner')<CR>", mode = { "o", "x" }},
		{"av", "<cmd>lua require('various-textobjs').value('outer')<CR>", mode = { "o", "x" }},

		{"ik", "<cmd>lua require('various-textobjs').key('inner')<CR>", mode = { "o", "x" }},
		{"ak", "<cmd>lua require('various-textobjs').key('outer')<CR>", mode = { "o", "x" }},

		{"L", "<cmd>lua require('various-textobjs').url()<CR>", mode = { "o", "x" }},

		{"in", "<cmd>lua require('various-textobjs').number('inner')<CR>", mode = { "o", "x" }},
		{"an", "<cmd>lua require('various-textobjs').number('outer')<CR>", mode = { "o", "x" }},

		{"!", "<cmd>lua require('various-textobjs').diagnostic()<CR>", mode = { "o", "x" }},

		{"iz", "<cmd>lua require('various-textobjs').closedFold('inner')<CR>", mode = { "o", "x" }},
		{"az", "<cmd>lua require('various-textobjs').closedFold('outer')<CR>", mode = { "o", "x" }},

		{"im", "<cmd>lua require('various-textobjs').chainMember('inner')<CR>", mode = { "o", "x" }},
		{"am", "<cmd>lua require('various-textobjs').chainMember('outer')<CR>", mode = { "o", "x" }},

		{"gw", "<cmd>lua require('various-textobjs').visibleInWindow()<CR>", mode = { "o", "x" }},
		{"gW", "<cmd>lua require('various-textobjs').restOfWindow()<CR>", mode = { "o", "x" }},

		{ "il", "<cmd>lua require('various-textobjs').mdlink('inner')<CR>",
			mode = { "o", "x" }, ft = {"markdown", "toml"}},
		{ "al", "<cmd>lua require('various-textobjs').mdlink('outer')<CR>",
			mode = { "o", "x" }, ft = {"markdown", "toml"}},

		{ "iC", "<cmd>lua require('various-textobjs').mdFencedCodeBlock('inner')<CR>",
			mode = { "o", "x" }, ft = {"markdown"}},
		{ "aC", "<cmd>lua require('various-textobjs').mdFencedCodeBlock('outer')<CR>",
			mode = { "o", "x" }, ft = {"markdown"}},

		{ "ic", "<cmd>lua require('various-textobjs').cssSelector('inner')<CR>",
			mode = { "o", "x" }, ft = {"css", "scss"}},
		{ "ac", "<cmd>lua require('various-textobjs').cssSelector('outer')<CR>",
			mode = { "o", "x" }, ft = {"css", "scss"}},

		{ "ix", "<cmd>lua require('various-textobjs').htmlAttribute('inner')<CR>",
			mode = { "o", "x" }, ft = {"css", "scss", "html", "xml", "vue"}},
		{ "ax", "<cmd>lua require('various-textobjs').htmlAttribute('outer')<CR>",
			mode = { "o", "x" }, ft = {"css", "scss", "html", "xml", "vue"}},

		{ "iD", "<cmd>lua require('various-textobjs').doubleSquareBrackets('inner')<CR>",
			mode = { "o", "x" }, ft = { "lua", "norg", "sh", "fish", "zsh", "bash", "markdown" }},
		{ "aD", "<cmd>lua require('various-textobjs').doubleSquareBrackets('outer')<CR>",
			mode = { "o", "x" }, ft = { "lua", "norg", "sh", "fish", "zsh", "bash", "markdown" }},

		{ "iP", "<cmd>lua require('various-textobjs').shellPipe('inner')<CR>",
			mode = { "o", "x" }, ft = { "sh", "bash", "zsh", "fish" }},
		{ "aP", "<cmd>lua require('various-textobjs').shellPipe('outer')<CR>",
			mode = { "o", "x" }, ft = { "sh", "bash", "zsh", "fish" }}
	}
}
