local ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if ok then
  lsp_installer.settings({
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  })
end
