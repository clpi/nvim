-- WINDOW SETTINGS KEYMAPS --

local M = {}

M.n = { maps = { name = "+window",
    ["-"] = { ':split<CR>', 'split down'},
    ["_"] = { ':vsplit<CR>', 'split right'},
    h = { ":wincmd H<CR>", "pane L"},
    j = { ":wincmd J<CR>", "pane D"},
    k = { ":wincmd K<CR>", "pane U"},
    l = { ":wincmd L<CR>", "pane R"},
    K = { ":resize +3<CR>", "height+3"},
    J = { ":resize -3<CR>", "height-3"},
    H = { ":vertical resize -3<CR>", "width-3"},
    L = { ":vertical resize +3<CR>", "width+3"},
    r = { name = "+resize",
	["="] = {':exe "resize ".(winheight(0)*2)<CR>', 'resize 2x'},
	["+"] = {':exe "resize ".(winheight(0)*3/2)<CR>', 'resize 1.5x'},
	["-"] = {':exe "resize ".(winheight(0)*1/2)<CR>', 'resize 0.5x'},
	["/"] = {':exe "resize ".(winheight(0)*2/3)<CR>', 'resize 0.66x'},
	k = { ":resize +3<CR>", "height+3"},
	j = { ":resize -3<CR>", "height-3"},
	h = { ":vertical resize -3<CR>", "width-3"},
	l = { ":vertical resize +3<CR>", "width+3"},
	K = { ":resize +5<CR>", "height+5"},
	J = { ":resize -5<CR>", "height-5"},
	H = { ":vertical resize -5<CR>", "width-5"},
	L = { ":vertical resize +5<CR>", "width+5"},
    }
} }
-- No changes in opts from prefix

M.v = M.n

return M
