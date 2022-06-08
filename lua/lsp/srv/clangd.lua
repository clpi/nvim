local M = {}
M.cmd = {
    "/opt/homebrew/bin/clangd",
    "--inlay-hints",
    "--header-insertion=iwyu",
    "--pretty",
    "--clang-tidy",
    "--completion-style=detailed",
    "--pch-storage=memory",
    "--all-scopes-completion",
    "--header-insertion-decorators",
    "--enable-config",
    "--background-index",
    "--query-driver=/opt/homebrew/include,/opt/local/include"
}
M.path = "/opt/local/bin/clangd"
return M

