local M = {}
M.altcmd = {
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
    -- "--query-driver=/opt/homebrew/include,/opt/local/include"
}

M.fallback = {
  -- "-j"
  -- "-resource-dir=~/.local/share/nvim/lsp_servers/clangd/clangd/lib/clang/14.0.3/include",
}

M.args = {
    -- "-resource-dir=/usr/local/include/clang",
    "--pch-storage=disk",
    "--background-index",
    "--malloc-trim",
    "--enable-config",
    "--all-scopes-completion",
    "--clang-tidy",
    "--function-arg-placeholders",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-dorators",
    -- "--query-driver='/sbin/clang*,/usr/sbin/clang*,/usr/bin/clang*'",
    "--hidden-features",
    "--include-cleaner-stdlib",
    "--ranking-model=heuristics",
    "--suggest-missing-includes",
    "--pretty"
  }

-- M.path = "/usr/bin/clangd"
return M

