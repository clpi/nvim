require('orgmode').setup_ts_grammar()
local parsers = require "nvim-treesitter.parsers"
local parser_config = parsers.get_parser_configs()

parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'org',
}

-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
--     additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
--   },
--   ensure_installed = {'org'}, -- Or run :TSUpdate org
-- }
--
require('orgmode').setup({
  org_agenda_files = {'~/mk/org/*', '~/mk/orgs/*'},
  org_default_notes_file = '~/mk/org/refile.org',
})
