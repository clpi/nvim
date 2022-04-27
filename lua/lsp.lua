local M = {}

local lspx_ok, lspx = pcall(require, "lsp_extensions")

M.autocmds = function()
  vim.cmd [[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
end

M.lsp_inlay_hints = function()
  if lspx_ok then
    require'lsp_extensions'.inlay_hints{
      highlight = "Comment",
      prefix = " > ",
      aligned = false,
      only_current_line = false,
      source = "always", 
      enabled = { "ChainingHint" }
    }
  end
end

M.lsp_diagnostics_ext = function()
  if lspx_ok then
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
      })
  end
end

M.define_signs = function()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  -- local signs = { Error = "•", Warn = "•", Hint = "•" , Info = "•" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
  vim.fn.sign_define("DiagnosticSignError", {
      text = " ",
      texthl = "DiagnosticSignError",
      numhl = "DiagnosticSignError"
  })
  vim.fn.sign_define("DiagnosticSignWarn", {
      text = " ",
      texthl = "DiagnosticSignWarn",
      numhl = "DiagnosticSignWarn"
  })
  vim.fn.sign_define("DiagnosticSignInfo", {
      text = " ",
      texthl = "DiagnosticSignInfo",
      numhl = "DiagnosticSignInfo"
  })
  vim.fn.sign_define("DiagnosticSignHint", {
      text = " ",
      texthl = "DiagnosticSignHint",
      numhl = "DiagnosticSignHint"
  })
end

M.autofloat_diagnostics = function()
    vim.o.updatetime = 150
    vim.cmd [[
      autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
    ]]
end

M.on_attach = function(client, bufnr)
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
M.capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  return capabilities
end

M.lspinstaller_enable = function()
  local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
  -- local ok, lsp_cfg = pcall(require, "nvim-lsp-config")
  if ok then
    lsp_installer.on_server_ready(function(server)
      local opts = {
        capabilities = M.capabilities(),
        on_attach = M.on_attach,
      }
      if server.name == "sumneko_lua" then
        server:setup({
          capabilities = M.capabilities(),
          on_attach = M.on_attach,
          settings = require("lsp.srv.lua").settings,
        })
        return
      elseif server.name == "rust_analyzer" then
        -- setup rust_tools
      elseif server.name == "pyright" then

      end
      server:setup(opts)
    end)
  end
end

M.setup = function()
  M.define_signs()
  -- M.lsp_inlay_hints()
  M.lspinstaller_enable()
end

return M
