-- once 0.10 is updated inlay hints are already avaliable
return {
	"lvimuser/lsp-inlayhints.nvim",
	event = "VeryLazy",
	enabled = function ()
		if vim.version().minor > 9 then
			return false
		end
		return true
	end,
	config = function ()
		local api = vim.api
		local lsp_inlayhints = require("lsp-inlayhints")

		lsp_inlayhints.setup({
			inlay_hints = {
				highlight = "Comment",
			}
		})

		local au_group = api.nvim_create_augroup("LspAttach_inlayhints", {})
		api.nvim_create_autocmd("LspAttach", {
			group = au_group,
			callback = function (args)
				if not (args.data and args.data.client_id) then
					return
				end

				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				lsp_inlayhints.on_attach(client, bufnr)
			end
		})
	end
}
