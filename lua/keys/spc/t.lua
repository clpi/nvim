lvim.builtin.which_key.mappings["t"] = {
-- return {
	name = "+toggle",
	t = { "<cmd>Trouble<cr>", "trouble" },
	w = { "<cmd>Trouble<cr>", "workspace" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "document" },
	q = { "<cmd>Trouble quickfix<cr>", "quickfix" },
	l = { "<cmd>Trouble loclist<cr>", "loclist" },
	r = { "<cmd>Trouble lsp_references<cr>", "references" },
  c = { "<CMD>ColorizerToggle<CR>", "colorizer"},
	T = { "<cmd>TodoTrouble<cr>", "todo" },
}
