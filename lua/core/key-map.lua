local keymap = vim.keymap
keymap.set('i', "<C-L>", "<right>")
keymap.set('i', "<C-H>", "<left>")
keymap.set('i', "<C-J>", "<down>")
keymap.set('i', "<C-K>", "<up>")
keymap.set('n', "J", "mzJ`z", {desc = "Append next line", silent = true})

keymap.set('n', 'n', "nzzzv", {silent = true})
keymap.set('n', 'N', "Nzzzv", {silent = true})

keymap.set('n', '<C-j>', ":m .+1<CR> ==",{ desc = "Line down", silent = true})
keymap.set('n', '<C-k>', ":m .-2<CR> ==",{ desc = "Line up", silent = true})

keymap.set('x', '<C-k>', ":m '<-2<CR>gv=gv",{ desc = "Line up", silent = true})
keymap.set('x', '<C-j>', ":m '>+1<CR>gv=gv",{ desc= "Line down", silent = true})

keymap.set({'v','n'}, "<leader>r", "r",{ desc = "Regular replace"})
keymap.set({'v','n'}, "<leader>x", "x",{ desc = "Regular char delete"})
keymap.set({'v','n'}, "r", "\"_r",{ desc = "Void replace"})
keymap.set({'v','n'}, "x", "\"_x",{ desc = "Void char delete"})
keymap.set({'v','n'}, "<leader>d", "\"_d",{ desc = "Void delete", noremap = true})
keymap.set({'v','n'}, '<leader>c', "\"_c", {desc = "Void change", noremap = false})
keymap.set({'v','n'}, '<leader>C', "\"_C", {desc = "Void change", noremap = false})

keymap.set({'v','n'}, "<leader>y", "\"+y",{ desc = "Yank to clipboard" })

keymap.set({'v','n'}, "<leader>p", "\"+p", {desc = "Paste from clipboard"})
keymap.set({'v','n'}, "<leader>P", "\"+P", {desc = "Paste from clipboard"})
keymap.set('x', "<leader>p", "\"_dh\"+p", {desc = "Paste from clipboard"})
keymap.set('x', "<leader>P", "\"+p", {desc = "Paste from clipboard"})
keymap.set('x', 'p', "\"_dhp")
keymap.set('x', 'P', "p")

keymap.set('n', "<leader>k", ":cprev<CR>zz", {desc = "Quick fix select previous"})
keymap.set('n', "<leader>j", ":cnext<CR>zz", {desc = "Quick fix select next"})

keymap.set('n', "<leader>q", ":cclose<CR>", {desc = "Close quick fix"})

keymap.set('', ';', ':')
keymap.set('', ':', ';')

keymap.set('n', 's', '^i')

keymap.set('n', "<leader><TAB>", ":bn<CR>", {silent = true})
keymap.set('n', "<leader><S-TAB>", ":bp<CR>", { silent = true })

keymap.set('c', "<C-k>", "<C-p>")

keymap.set('c', "<C-j>", "<C-n>")

keymap.set('n', '0', ":silent! call search('^.')<CR>^", {silent = true})

keymap.set('n', '<leader>lz', function ()
	vim.opt.lazyredraw = not vim.opt.lazyredraw:get()
	print(string.format("Lazy redraw is: %s", vim.opt.lazyredraw:get()))
end, {desc= "Toggle lazy redraw."})

-- Allow me to tab over specified chars.
keymap.set('i', "<TAB>",function ()
    local chars_tab_over = {'"', "'", '{', '}', '(', ')', '[', ']' }

    local cur_cursor_pos = vim.fn.col(".")
    local current_char = vim.fn.getline("."):sub(cur_cursor_pos, cur_cursor_pos)

    for _, char in pairs(chars_tab_over) do
        if current_char == char then
            return "<right>"
        end
    end

    return "<TAB>"
end, {expr = true, silent = true})

keymap.set('c', "<CR>", function ()
	if vim.fn.pumvisible() == 1 then
		return "<C-y>"
	end
	return "<CR>"
end, { expr = true })

keymap.set("n", "i", function()
	if #vim.fn.getline "." == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })
