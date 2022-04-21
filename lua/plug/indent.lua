-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

local M = {}
M.setup = function()
  vim.cmd[[ highlight IndentBlankline guifg=#776f8a guibg=#1a1823]]
  vim.cmd[[ highlight IndentBlanklineContextChar guifg=#404755]]
  vim.cmd[[ highlight IndentBlanklineChar guifg=#303545]]
  require("indent_blankline").setup {
      -- for example, context is off by default, use this to turn it on
      -- char = "",
      --
      buftype_exclude = {
          'terminal', 'nofile',
      },
      filetype_exclude = {
          'man',
          'packer',
          'help',
          "alpha",
          "NvimTree",
          "ToggleTerm"
      },
      context_char = '┃',
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      show_trailing_blankline_indent = false,
  }
end
return M
