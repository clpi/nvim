local M = {}
local pandoc = require'pandoc'

pandoc.setup{
  mapping = {
    -- normal mode
    n = {
      ['<leader>pr'] = function()
        pandoc.render.init()
      end,
      ['<leader>ps'] = function()
        -- Make your pandoc command
        local input = vim.api.nvim_get_buf_name(0)
        pandoc.render.build{
          input = input,
          args = {
            {'--standalone'},
            {'--toc'},
            {'--filter', 'pandoc-crossref'},
            {'--pdf-engine', 'xelatex'}
          },
          output = 'pandoc.pdf'
        }
      end,
      ['<leader>ep'] = function()
        -- require nabla.nvim
        pandoc.equation.show()
      end
    }
  }
}


M.config = {
  mapping = M.mapping,
  commands = {
    -- Enable vim commands
    -- :Pandoc
    -- @type: boolean
    enable = true,
    -- Extended Mode
    -- When enabled the arguments passed by the `:Pandoc` command will be extended with the default arguments
    -- @type: boolean
    extended = true,
  },
  -- The pandoc executable
  -- @type: string
  binary = 'pandoc',
  -- Pandoc default options
  default = {
    -- Output file name with extension
    -- @type: string
    output = '%s.pdf',
    -- List of arguments
    -- @type: table
    args = {
      { '--standalone' },
    },
  },
  equation = {
    -- Border style.
    -- 'none', 'single', 'double' or 'rounded'
    -- @type: string
    border = 'single',
  },
}
return M
