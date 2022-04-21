local ok , wk = pcall(require,"which-key")
if ok then 
  local codeopts = {
    mode = {"v", "i", "n"},
    prefix = "<C-c>",
    silent = true,
    noremap = true,
    nowait = true,
  }
  wk.register({ 
    ["<C-c>"] = {
      name = "+code",
      ["<C-a>"] = {"<CMD>CodeActionMenu<CR>", "code actions"},
      ["<C-k>"] = {"<cmd>lua vim.lsp.buf.hover()<CR>", "hover"},
      ["<C-d>"] = {'<Cmd>TroubleToggle workspace_diagnostics<CR>', "ws diagnostics"},
      ["<C-r>"] = {'<Cmd>TroubleToggle lsp_references<CR>', "diagnostics"},
      ["<C-i>"] = {'<Cmd>TroubleToggle lsp_implementations<CR>', "diagnostics"},
      ["d"]     = {'<Cmd>TroubleToggle document_diagnostics<CR>', "doc diagnostics"},
      ["q"]     = {'<Cmd>TroubleToggle quickfix<CR>', "quickfix"},
      ["l"]     = {'<Cmd>TroubleToggle loclist<CR>', "loclist"},
      ["i"]     = {'<Cmd>TroubleToggle lsp_implementations<CR>', "loclist"},
      ["c"]     = {'<CMD>Copilot panel<CR>', "copilot"},
      ["s"]     = {'<CMD>CmpStatus<CR>', "copilot"},
      ["<C-t>"]     = {'<Cmd>TroubleToggle telescope<CR>', "telescope"},
      ["<C-f>"]     = {'<Cmd>TroubleToggle lsp_definitions<CR>', "definitions"},
      ["<C-y>"]     = {'<Cmd>TroubleToggle lsp_type_definitions<CR>', "typedefs"},
      ["<C-j>"]     = {"<Cmd>TermExec cmd='just'<CR>", "just"},
      ["<Cr>"]     = {"<Cmd>TermExec cmd='make'<CR>", "just"},
      ["<C-p>"]     = {"<CMD>Copilot panel<CR>", "just"},
      ["j"]     = {"<Cmd>TermExec cmd='just'<CR>", "just"},
      ["m"]     = {"<Cmd>TermExec cmd='make'<CR>", "just"},
      ["M"]     = {"<Cmd>TermExec cmd='cargo make'<CR>", "just"},
      ["S"]     = { "<CMD>SymbolsOutline<CR>", "symbols"},
      ["O"]     = { "<CMD>SymbolsOutline<CR>", "outline"},
    }
  })

else
  -- vim.notify("ERROR: Couldnt loadd whichkey")
end
