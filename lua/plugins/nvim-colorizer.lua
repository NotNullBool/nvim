return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		require("colorizer").setup(nil, { RGB = false, names = false, RRGGBBAA = true})
	end
}
