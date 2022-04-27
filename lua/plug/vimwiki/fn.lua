local M = {}

M.vw_incomplete_tasks = function()
  vim.cmd[[
    lvimgrep /- \[ \]/ %:p
    lopen
  ]]
end

M.vw_all_incomplete_tasks = function()
  vim.cmd[[
    VimwikiSearch /- \[ \]/
    lopen
  ]]
end

return M
