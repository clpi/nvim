local M = {}

local lsp = require("lsp")

M.diag_handler = function()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = { spacing = 2 },
      update_in_insert = true,
    }
  )
end

M.setup = function()
    require("lean").setup({
      abbreviation = { builtin = true },
      lsp = {
        cmd = {
          "lean-language-server",
          "--stdio", "--",
          "-M", "4096",
          "-T", "30000000" },
        on_attach = lsp.on_attach
      },
      lsp3 = { on_attach = lsp.on_attach },
      mappings = true,
    })
    M.diag_handler()
end
return M
