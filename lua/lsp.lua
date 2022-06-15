local M = {}

local kmap = vim.keymap.set
local lsp = vim.lsp
local buf = vim.lsp.buf

local lspx_ok, lspx = pcall(require, "lsp_extensions")



M.on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  local op = { noremap = true, silent = true, }
  vim.cmd[[nnoremap <silent><nowait> ,,a <ESC>:CodeActionMenu<CR>]]
  vim.cmd[[nnoremap <silent><nowait> ,,a <ESC>:CodeActionMenu<CR>]]

  kmap("n",',s', vim.diagnostic.setloclist, { noremap = true, silent = true })
  kmap("n",',a', '<ESC>:CodeActionMenu<CR>', op)
  kmap("n",',h', buf.hover, op)
  kmap("n",',o', vim.diagnostic.open_float, { noremap = true })
  kmap("n",',R', buf.rename, { noremap = true })

  kmap("i",'<c-z>', buf.signature_help, op)
  kmap("n",'ga', buf.code_action, op)
  kmap("n",'g-', vim.diagnostic.open_float, { noremap = true })
  kmap("n",'g=', buf.signature_help, op)
  kmap("n",'gh', buf.declaration, op)
  kmap("n",'gR', '<cmd>TroubleToggle lsp_references<CR>', op)
  kmap("n",'gE', '<cmd>TroubleToggle lsp_definitions<CR>', op)
  kmap("n",'gI', '<cmd>TroubleToggle lsp_implementations<CR>', op)
  kmap("n",'gs', buf.document_symbol, op)
  kmap("n",'gS', buf.workspace_symbol, op)
  kmap("n",'c<CR>', '<ESC>:CodeActionMenu<CR>', op)
  kmap("n",'gy', buf.type_definition, op)
  kmap("i",'<C-x>', buf.signature_help, op)
  kmap("n",'<S-Tab>', vim.diagnostic.goto_prev, { noremap = true })
  kmap("n",'<Tab>', vim.diagnostic.goto_next, { noremap = true })
  kmap("n",'<space>rn', buf.rename, { noremap = true })
  kmap("n",'<space>wa', buf.add_workspace_folder, op)
  kmap("n",'<space>wr', buf.remove_workspace_folder, op)
  kmap("n",'<space>rn', buf.rename, op)
  kmap("n",',ca', buf.code_action, op)
  kmap("n",'<space>F', buf.formatting, op)
-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', vim.lsp.omnifunc)
  kmap('n', 'ge', buf.declaration, opts)
  kmap('n', 'gd', buf.definition, opts)
  kmap('n', 'gi', buf.implementation, opts)
  kmap('n', '<c-n>', buf.signature_help, opts)
  kmap('n', '<leader>Wa', buf.add_workspace_folder, opts)
  kmap('n', '<leader>Wr', buf.remove_workspace_folder, opts)
  kmap('n', '<leader>Wl', function()
    vim.inspect(buf.list_workspace_folders())
  end, opts)
  kmap('n', '<leader>D', buf.type_definition, opts)
  kmap('n', '<leader>rn', buf.rename, opts)
  kmap('n', 'gr', buf.references, opts)
  kmap('n', '\a', buf.code_action, opts)
  kmap('n', '<space>cs', require('telescope.builtin').lsp_document_symbols, opts)
  kmap("n",'<space>cy', buf.type_definition, op)
  kmap("n",'<space>ca', '<ESC>:CodeActionMenu<CR>', op)
  vim.api.nvim_create_user_command("Format", buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
M.capabilities = require("lsp.completion").capabilities

M.opts = {
  capabilities = M.capabilities(),
  on_attach = M.on_attach,
  handlers = require("lsp.handlers").handlers,
}

M.lspinstaller_enable = function()
  require("nvim-lsp-installer").on_server_ready(function(server)
    if server.name == "sumneko_lua" then
      server:setup({
        -- settings = require("lsp.srv.lua").settings,
      })
      return
    elseif server.name == "clangd" then
      local clangd = require("lsp.srv.clangd")
      server:setup({
        cmd = clangd.path,
        settings = {
          clangd = {
            path = clangd.path,
            arguments = clangd.args,
            fallbackFlags = clangd.fallback,
            checkUpdates = true,
          }
        }
      })
      return
    elseif server.name == "ccls" then
      server:setup({
        cmd = { "/usr/bin/ccls", "-v=2"}
      })
      return
    elseif server.name == "rust_analyzer" then
      return
    elseif server.name == "sqls" then
      server:setup({
        on_attach = function(client, bufnr)
          require("sqls").on_attach(client, bufnr)
        end,
      })
      return
    else server:setup(M.opts)
    end
  end)
end

M.nonauto_server_setup = function()
  require"lspconfig".mint.setup{ }
  -- require'lspconfig'.typeprof.setup{}
  -- require"lspconfig".ols.setup{ }
  require'lspconfig'.please.setup{ }
  require'lspconfig'.pyre.setup{ }
  -- require'lspconfig'.racket_langserver.setup{ }
  require"lspconfig".tilt_ls.setup { }

  -- vim.cmd[[ autocmd BufRead Tiltfile setf=tiltfile ]]
end

M.setup = function()
  require("lsp.completion").setup()
  require("lsp.handlers").setup()
  require("lsp.diagnostics").setup()
  M.nonauto_server_setup()
  M.lspinstaller_enable()
  require("lspconfig").hls.setup{}
end


return M

