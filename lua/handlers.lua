local M = {}
local with = vim.lsp.with
local handlers = vim.lsp.handlers

M.border = {
  {"🭽", "FloatBorder"},
  {"▔", "FloatBorder"},
  {"🭾", "FloatBorder"},
  {"▕", "FloatBorder"},
  {"🭿", "FloatBorder"},
  {"▁", "FloatBorder"},
  {"🭼", "FloatBorder"},
  {"▏", "FloatBorder"},
}

M.handlers = {
  ["textDocument/hover"] =  with(handlers.hover, {
    border = M.border,
  }),
  ["textDocument/signatureHelp"] =  with(handlers.signature_help, {
    border = M.border
  }),
  ["textDocument/references"] = with(handlers.references, {
    loclist = true,
    border = M.border,
  })
}


M.setup = function()
  handlers["textDocument/hover"] = M.handlers["textDocument/hover"]
  handlers["textDocument/signatureHelp"] = M.handlers["textDocument/signatureHelp"]
  handlers["textDocument/references"] = M.handlers["textDocument/references"]
end

return M
