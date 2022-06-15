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

-- vim.cmd[[ colorscheme cayu ]]
require("cayu").colorscheme()
--
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0


