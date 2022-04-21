-- CODE SETTINGS AND KEYMAPS  [ <space>- ] --

local M = {}

M.n = { maps = { name = "+code",
    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', "actions" },
    m = { '<ESC>:CodeActionMenu<CR>', 'codeaction'},
    D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', "declarations"},
    h = { '<cmd>lua vim.lsp.buf.hover()<CR>', "hover" },
    s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', "signature" },
    r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'references'},
    f = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'definition' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementations'},
    t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition'},
    A = { '<ESC>:AerialTreeToggle<CR>', "aerial" },
    R = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename' },
    d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'diagnostics'},
    F = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'formatting'},
    I = { ":IronRepl<CR>", "REPL"},
    x = { ":CodeActionMenu<CR>", "actions (alt)"},
    L = { name = "+lsp",
	i = { ":LspInfo<CR>", "info" },
	I = { ":LspInstall<space><C-i>", "install" },
	f = { ":LspInstallInfo<CR>", "install" },
	U = { ":LspUninstall<space><C-i>", "uninstall" },
	s = { ":LspStart<CR>", "start"},
	S = { ":LspStop<CR>", "stop"},
	r = { ":LspRestart<CR>", "restart"},
    }
} }

M.v = M.n

return M
