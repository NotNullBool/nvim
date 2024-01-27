---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	version = false,
	main = "nvim-treesitter.configs",
	build = ":TSUpdate",
	-- event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		"]=", "]:", "]i", "]l", "]b", "]f", "]c", "]N",

		"[=", "[:", "[i", "[l", "[b", "[f", "[c", "[N",

		"<leader>on", "<leader>op",

		{"a=", mode = {'o','x'}}, {"i=", mode = {'o','x'}},
		{"a:", mode = {'o','x'}}, {"i:", mode = {'o','x'}},
		{"ai", mode = {'o','x'}}, {"ii", mode = {'o','x'}},
		{"al", mode = {'o','x'}}, {"il", mode = {'o','x'}},
		{"ab", mode = {'o','x'}}, {"ib", mode = {'o','x'}},
		{"af", mode = {'o','x'}}, {"if", mode = {'o','x'}},
		{"ac", mode = {'o','x'}}, {"ic", mode = {'o','x'}},
		{"aN", mode = {'o','x'}},
	},
	opts = {
		textobjects = {
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- you can use the capture groups defined in textobjects.scm
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region (TSTextObject)" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region (TSTextObject)" },

					["a:"] = { query = "@parameter.outer", desc = "Select outer part of an parameter/field region (TSTextObject)" },
					["i:"] = { query = "@parameter.inner", desc = "Select inner part of an parameter/field region (TSTextObject)" },

					["ai"] = { query = "@conditional.outer", desc = "Select outer part of an conditional region (TSTextObject)" },
					["ii"] = { query = "@conditional.inner", desc = "Select inner part of an conditional region (TSTextObject)" },

					["al"] = { query = "@loop.outer", desc = "Select outer part of an loop region (TSTextObject)" },
					["il"] = { query = "@loop.inner", desc = "Select inner part of an loop region (TSTextObject)" },

					["ab"] = { query = "@block.outer", desc = "Select outer part of an block region (TSTextObject)" },
					["ib"] = { query = "@block.inner", desc = "Select inner part of an block region (TSTextObject)" }, -- overrides default text object block of parenthesis to parenthesis

					["af"] = { query = "@function.outer", desc = "Select outer part of an function region (TSTextObject)" },
					["if"] = { query = "@function.inner", desc = "Select inner part of an function region (TSTextObject)" },

					["ac"] = { query = "@class.outer", desc = "Select outer part of an class region (TSTextObject)" },
					["ic"] = { query = "@class.inner", desc = "Select inner part of an class region (TSTextObject)" },

					["aN"] = { query = "@comment.outer", desc = "Select outer part of an notation region (TSTextObject)" },
				},
				include_surrouding_whitespace = true,
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>on"] = "@parameter.inner", --swap object under cursor with next
				},
				swap_previous = {
					["<leader>op"] = "@parameter.inner", --swap object under cursor with previous
				},
			},
			move = {
				enable = true,
				goto_next ={
					["]="] = "@assignment.*",
					["]:"] = "@parameter.*",
					["]i"] = "@conditional.*",
					["]l"] = "@loop.*",
					["]b"] = "@block.*",
					["]f"] = "@function.*",
					["]c"] = "@class.*",
					["]N"] = "@comment.*",
				},
				goto_previous = {
					["[="] = "@assignment.*",
					["[:"] = "@parameter.*",
					["[i"] = "@conditional.*",
					["[l"] = "@loop.*",
					["[b"] = "@block.*",
					["[f"] = "@function.*",
					["[c"] = "@class.*",
					["[N"] = "@comment.*",
				}
			}
		},
	},
	config = function (_, opts)
		require("nvim-treesitter.configs").setup(opts)
		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ":", ts_repeat_move.repeat_last_move_next, {desc = "Repeat last (TSTextObject) move next"})
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, {desc = "Repeat last (TSTextObject) move previous"})
	end
}
