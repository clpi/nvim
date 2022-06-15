local diag = vim.diagnostic
local float = vim.diagnostic.open_float
local dcfg = diag.config
local fn = vim.fn
local au = vim.api.nvim_create_autocmd
local o = vim.o

local M = {}
M.config = function()
  dcfg({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
  })
end

M.open_floats = function()
    o.updatetime = 150
    au({"CursorHold", "CursorHoldI"}, {
      pattern={"*"},
      callback = function()
        float(nil, {
          border=require("lsp.handlers").border,
          focusable=false,
          scope = "cursor"
        })
    end,
  })
end


M.set_signs = function()
  local signs = {}
  local icons = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  local count = 0
  for type, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. type
    local sign = { name = hl, text = icon, texthl = hl, numhl = hl }
    fn.sign_define(hl, sign)
    signs[count] = sign
    count = count + 1
  end
  return signs
end

M.signs = {
  active = true,
  values = M.set_signs(),
}

M.setup = function()
  M.set_signs()
  M.config()
  M.open_floats()
end

return M
