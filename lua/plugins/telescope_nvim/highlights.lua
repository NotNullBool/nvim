local highlights = {}
highlights.setup = function()
	local drac_colors = require("dracula").colors()
	local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)

	local preview_bg = drac_colors.bg
	local result_bg = drac_colors.menu
	local prompt_bg = drac_colors.black
	local prompt_fg_special = drac_colors.red
	local preview_special = drac_colors.purple
	local result_special = drac_colors.pink
	local result_selection = drac_colors.selection

	----------------------------------------------------------------------
	--                              Prompt                              --
	----------------------------------------------------------------------
	vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {
		fg = prompt_bg,
		bg = prompt_bg
	})

	vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {
		fg = normal_hl.foreground,
		bg = prompt_bg,
	})

	vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {
		fg = normal_hl.foreground,
		bg = prompt_fg_special,
	})

	vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {
		fg = prompt_fg_special,
		bg = prompt_bg,
	})

	vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
		fg = prompt_fg_special,
		bg = prompt_bg,
	})

	----------------------------------------------------------------------
	--                              Result                              --
	----------------------------------------------------------------------
	vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {
		fg = result_bg,
		bg = result_bg,
	})

	vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', {
		fg = normal_hl.foreground,
		bg = result_bg,
	})

	vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {
		fg = normal_hl.foreground,
		bg = result_special,
	})

	vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', {
		fg = result_special,
		bg = result_selection,
	})

	----------------------------------------------------------------------
	--                             Preview                              --
	----------------------------------------------------------------------

	vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {
		fg = preview_bg,
		bg = preview_bg,
	})

	vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', {
		fg = normal_hl.foreground,
		bg = preview_bg,
	})

	vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {
		fg = normal_hl.foreground,
		bg = preview_special,
	})

end
return highlights
