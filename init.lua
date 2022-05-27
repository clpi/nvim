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

vim.cmd[[ colorscheme cayu]]

-- vim.wo.colorscheme = "cayu"
-- vim.api.nvim_command("colorscheme cayu")

-- vim.cmd("colorscheme cayu")
