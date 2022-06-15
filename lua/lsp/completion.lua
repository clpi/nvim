local M = {}
local CompletionItemKind = vim.lsp.protocol.CompletionItemKind
local doc = vim.lsp.handlers.textDocument
local protoc = vim.lsp.protocol

M.icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

M.capabilities = function()
  local c = protoc.make_client_capabilities()
  c = require('cmp_nvim_lsp').update_capabilities(c)
  c.textDocument.completion.completionItem = {
    documentationFormat = { 'markdown', 'plaintext' },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    resolveSupport = {
      properties = {
        'documentation', 'detail', 'additionalTextEdits',
      },
    }
  }
  return c
end

function M.setup_signs()
  local kinds = CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

M.setup = function()
  M.setup_signs()
end

return M
