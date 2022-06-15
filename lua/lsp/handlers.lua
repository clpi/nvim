local M = {}
local extok, lspext = pcall("lsp_extensions")
local with = vim.lsp.with
local handlers = vim.lsp.handlers
local diag = require("lsp.diagnostics")

M.virtualtxt = {
  prefix = "»",
  spacing = 2,
}

M.border = {
  source = "always",
  {"🭽", "FloatBorder"},
  {"▔", "FloatBorder"},
  {"🭾", "FloatBorder"},
  {"▕", "FloatBorder"},
  {"🭿", "FloatBorder"},
  {"▁", "FloatBorder"},
  {"🭼", "FloatBorder"},
  {"▏", "FloatBorder"},
}

M.lsp_inlay_hints = function()
  if extok then
    lspext.inlay_hints{
      highlight = "Comment",
      prefix = " > ",
      aligned = false,
      only_current_line = false,
      source = "always", 
      enabled = { "ChainingHint" }
    }
  end
end

M.extdiag = function()
  if extok then
    return require("lsp_extensions.workspace.diagnostic")
  else return nil
  end
end

M.float = {
  always = true,
}

M.handlers = {
  ["textDocument/publishDiagnostics"] = function() 
    local d = handlers.diagnostic
    if extok then
      local d = M.extdiag().diagnostic() or handlers.diagnostic
    end
    return with(d, {
      border = M.border,
      float = M.float,
      enabled = true,
      severity_sort = true,
      virtual_text = M.virtualtxt,
      signs = diag.signs,
      update_in_insert = true,
      underline = true,
    })end,
  ["textDocument/hover"] =  with(handlers.hover, {
    border = M.border,
    enabled = true,
    signs = diag.signs,
    update_in_insert = true,
    float = M.float,
  }),
  ["textDocument/signatureHelp"] =  with(handlers.signature_help, {
    float = M.float,
    enabled = true,
    update_in_insert = true,
    border = M.border,
    signs = diag.signs
  }),
  ["textDocument/references"] = with(handlers.references, {
    loclist = true,
    enabled = true,
    border = M.border,
    signs = diag.signs
  })
}


M.setup = function()
  handlers["textDocument/hover"] = M.handlers["textDocument/hover"]
  handlers["textDocument/signatureHelp"] = M.handlers["textDocument/signatureHelp"]
  handlers["textDocument/references"] = M.handlers["textDocument/references"]
  handlers["textDocument/publishDiagnostics"] = M.handlers["textDocument/publishDiagnostics"]
end

return M
