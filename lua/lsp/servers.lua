local lsp = vim.lsp
local servers = require("nvim-lsp-installer.servers")
local null_ls = require("null-ls")
local diagnostic = vim.diagnostic;
-- require("lvim.lsp.manager").setup("rust_analyzer", {})
local opts = {
  

}
require("lvim.lsp.manager").setup("pyright", opts)
require("lvim.lsp.manager").setup("pyright", opts)
require("lvim.lsp.manager").setup("pylsp", {
    filetypes = { "python" },
    settings = {
        python = {
            linting = {
                flake8Enabled=false,
                pylintEnabled=true,
                mypyEnabled=true,
                pycodestyleEnabled=false,
            },
            analysis = {
                disableOrganizeImports = false,
                autoImportCompletions = true,
                diagnosticMode = "openFilesOnly",
                diagnosticSeverityOverrides = {

                },
                stubPath = "typings",
                useLibraryCodeForTypes = true,
                autoSearchPaths = true
            }
        },
    }
})

