
-- if exists('g:vscode') then

-- else 

-- end


require("plug")
require("opts")
require("acmd")
require("abbr")
require("cmd")
require("lsp").setup()
require("plug.treesitter")
require("plug.telescope")
require("plug.cmp")
require("keys")

vim.cmd[[ colorscheme cayu ]]

vim.g.do_filetype_lua = 1
vim.g.did_load_filetyles = 0

-- vim.wo.colorscheme = "cayu"
-- vim.api.nvim_command("colorscheme cayu")

-- vim.cmd("colorscheme cayu")
