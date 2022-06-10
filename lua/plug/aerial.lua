require("aerial").setup {
  backends = {
    "treesitter", "lsp", "markdown"
  },
  width = 20,
  min_width = 15,
  max_width = 40,
  open_automatic = true,
  treesitter = {
    update_delay = 0,
  },
  markdown = {
    update_delay = 0,
  },
  lsp = {
    diagnostics_trigger_update = true,
    update_delay = 0,
    update_when_errors = true,
  }
}
