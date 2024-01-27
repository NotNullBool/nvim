-- for automatic folding using treesitter (other options like lsp config if nesscary)
return {
	"kevinhwang91/nvim-ufo",
	lazy = false,
	dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter", },
	keys = { { "zK", function () require("ufo.preview"):peekFoldedLinesUnderCursor() end, desc = "Preview folded lines under cursor", } },
	cmd = { "UfoEnable", "UfoDisable", "UfoInspect", "UfoAttach", "UfoDetach", "UfoEnableFold", "UfoDisableFold" },
	opts = {
		fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (' 󰁂 %d '):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, {chunkText, hlGroup})
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, {suffix, 'MoreMsg'})
			return newVirtText
		end,
		---@diagnostic disable-next-line: unused-local
		provider_selector = function(bufnr, filetype, buftype)
			return {'treesitter', 'indent'}
		end
	},
	config = function(_, opts)
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local api = vim.api
		local myGroup = api.nvim_create_augroup("Remember Folds", {clear = true})
		api.nvim_create_autocmd({"BufWinLeave"}, {
			group = myGroup,
			command = "silent! mkview",
		})
		api.nvim_create_autocmd({"BufWinEnter"}, {
			group = myGroup,
			command = "silent! loadview",
		})

		require("ufo").setup(opts)
	end
}
