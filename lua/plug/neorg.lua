local M = {}

local parsecfg = require("nvim-treesitter.parsers").get_parser_configs()

M.get_parsers = function()
    parsecfg.norg_meta = {
        install_info = {
          url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
          files = { "src/parser.c" },
          branch = "main"
        }
    }
    parsecfg.norg_table = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
            files = { "src/parser.c" },
            branch = "main"
        }
    }
end

M.setup = function()
  M.get_parsers()
  require("neorg").setup {

  }
end

return M
