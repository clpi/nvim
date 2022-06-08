-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  -- { command = "luacheck", filetypes = { "lua" } },
  { command = "shellcheck", filetypes = { "bash", "sh", "zsh" }, extra_args = { "--severity", "warning" }, },
  { command = "codespell", filetypes = { "javascript", "python" }, },
  -- { command = "selene", filetypes = { "lua" },
  -- { command = "pylint", filetypes = { "python" }},
  -- { command = "mypy", filetypes = { "python" }},
}
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "black" },
--   {
--     command = "eslint_d",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "javascriptreact" },
--   },
-- }
