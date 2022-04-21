-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black" },
--   {
--     command = "prettier",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "rustfmt", filetypes = { "rust" } },
  -- { command = "stylua", filetypes = { "lua" } },
  { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- { command = "yapf", filetypes = { "python" } },
  { command = "prettier", extra_args = { "--print-with", "100" }, filetypes = { "typescript", "typescriptreact" },
    -- { command = "clang_format", filetypes = { "c", "cpp" } }
  },
}
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
---@usage arguments to pass to the formatter
-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
