local M = {}

M.mkdir = function()
	local dir = vim.fn.expand('%:p:h')
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, 'p')
	end
end

M.setup = function()
  vim.api.nvim_create_augroup("mkdir_augroup", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    group = "mkdir_augroup",
    callback = function()
      M.mkdir()
    end,
  })
end

return M
