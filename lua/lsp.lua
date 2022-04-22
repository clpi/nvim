vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  require('lsp_extensions.workspace.diagnostic').handler, {
    float = {
        source = "always",
    },
    severity_sort = true,
    virtual_text = {
      prefix = "»",
      spacing = 2,
    },
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      }
    },
    update_in_insert = true,
    underline = true,
  }
)
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  local op = { noremap = true, silent = true, }
  vim.cmd[[nnoremap <silent><nowait> ,,a <ESC>:CodeActionMenu<CR>]]
  vim.cmd[[nnoremap <silent><nowait> ,,a <ESC>:CodeActionMenu<CR>]]

  vim.keymap.set("n",',s', vim.diagnostic.setloclist, { noremap = true, silent = true })
  vim.keymap.set("n",',a', '<ESC>:CodeActionMenu<CR>', op)
  vim.keymap.set("n",',h', vim.lsp.buf.hover, op)
  vim.keymap.set("n",',o', vim.diagnostic.open_float, { noremap = true })
  vim.keymap.set("n",',R', vim.lsp.buf.rename, { noremap = true })

  vim.keymap.set("i",'<c-z>', vim.lsp.buf.signature_help, op)
  vim.keymap.set("n",'ga', vim.lsp.buf.code_action, op)
  vim.keymap.set("n",'g-', vim.diagnostic.open_float, { noremap = true })
  vim.keymap.set("n",'g=', vim.lsp.buf.signature_help, op)
  vim.keymap.set("n",'gh', vim.lsp.buf.declaration, op)
  vim.keymap.set("n",'gR', '<cmd>TroubleToggle lsp_references<CR>', op)
  vim.keymap.set("n",'gE', '<cmd>TroubleToggle lsp_definitions<CR>', op)
  vim.keymap.set("n",'gI', '<cmd>TroubleToggle lsp_implementations<CR>', op)
  vim.keymap.set("n",'gs', vim.lsp.buf.document_symbol, op)
  vim.keymap.set("n",'gS', vim.lsp.buf.workspace_symbol, op)
  vim.keymap.set("n",'c<CR>', '<ESC>:CodeActionMenu<CR>', op)
  vim.keymap.set("n",'gy', vim.lsp.buf.type_definition, op)
  vim.keymap.set("i",'<C-x>', vim.lsp.buf.signature_help, op)
  vim.keymap.set("n",'<S-Tab>', vim.diagnostic.goto_prev, { noremap = true })
  vim.keymap.set("n",'<Tab>', vim.diagnostic.goto_next, { noremap = true })
  vim.keymap.set("n",'<space>rn', vim.lsp.buf.rename, { noremap = true })
  vim.keymap.set("n",'<space>wa', vim.lsp.buf.add_workspace_folder, op)
  vim.keymap.set("n",'<space>wr', vim.lsp.buf.remove_workspace_folder, op)
  vim.keymap.set("n",'<space>rn', vim.lsp.buf.rename, op)
  vim.keymap.set("n",',ca', vim.lsp.buf.code_action, op)
  vim.keymap.set("n",'<space>F', vim.lsp.buf.formatting, op)
-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', vim.lsp.omnifunc)
  vim.keymap.set('n', 'ge', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<c-n>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>Wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>Wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>Wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '\a', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<space>cs', require('telescope.builtin').lsp_document_symbols, opts)
  vim.keymap.set("n",'<space>cy', vim.lsp.buf.type_definition, op)
  vim.keymap.set("n",'<space>ca', '<ESC>:CodeActionMenu<CR>', op)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})
lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
  if server.name == "sumneko_lua" then
    server:setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = require("lsp.srv.lua").settings,
    })
    return
  elseif server.name == "rust_analyzer" then
  end
  server:setup(opts)
end)
