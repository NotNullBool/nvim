return{
	'Mofiqul/dracula.nvim',
	priority = 1000,
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			-- customize dracula color palette
			colors = {
				bg = "#22212C",
				fg = "#F8F8F2",
				selection = "#44475A",
				comment = "#7970A9",
				red = "#FF5555",
				orange = "#FFB86C",
				yellow = "#FFFF80",
				green = "#50fa7b",
				purple = "#9580FF",
				cyan = "#80FFEA",
				pink = "#FF80BF",
				bright_red = "#FF6E6E",
				bright_green = "#8AFF80",
				bright_yellow = "#F1FA8C",
				bright_blue = "#BD93F9",
				bright_magenta = "#FF92DF",
				bright_cyan = "#A4FFFF",
				bright_white = "#FFFFFF",
				menu = "#21222C",
				visual = "#3E4452",
				gutter_fg = "#4B5263",
				nontext = "#3B4048",
				white = "#ABB2BF",
				black = "#191A21",
			},
			-- show the '~' characters after the end of buffers
			show_end_of_buffer = false, -- default false
			-- use transparent background
			transparent_bg = false, -- default false
			-- set custom lualine background color
			-- lualine_bg_color = "#44475a", -- default nil
			-- set italic comment
			italic_comment = true, -- default false
			-- overrides the default highlights with table see `:h synIDattr`
			overrides = function (colors)
				return {
					MoreMsg = { fg = colors.bright_green, ctermfg = 121 },
					NonText = { fg = colors.white }
				}
			end
			-- You can use overrides as table like this
			-- overrides = {
				--   NonText = { fg = "white" }, -- set NonText fg to white
				--   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
				--   Nothing = {} -- clear highlight of Nothing
				-- },
				-- Or you can also use it like a function to get color from theme
				-- overrides = function (colors)
					--   return {
						--     NonText = { fg = colors.white }, -- set NonText fg to white of theme
						--   }
						-- end,
					})
					vim.cmd[[colorscheme dracula]]
				end
			}
