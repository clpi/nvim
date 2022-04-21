local ok, gps = pcall(require, "nvim-gps")
local gpsll = {}
if ok then
  gpsll = {
    gps.get_location,
    cond = gps.is_available,
    left_padding = 1
  }
end

      local d = { -- NOTE: diagnostics
        "diagnostics",
        sources = { "nvim" },
        sections={"error", "warn", "info", "hint"},
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      }
local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  only_wide = function()
    return vim.fn.winwidth(0) > 120 and
           vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
  only_xwide = function()
    return vim.fn.winwidth(0) > 160 and
           vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}
local ts={ -- NOTE: Treesitter
        function()
          local b = vim.api.nvim_get_current_buf()
          if next(vim.treesitter.highlighter.active[b]) then
            return " "
          end
          return ""
        end}
-- local colors = {
--   blue   = '#80a0ff',
--   cyan   = '#79dac8',
--   black  = '#080808',
--   white  = '#c6c6c6',
--   red    = '#ff5189',
--   violet = '#d183e8',
--   grey   = '#303030',
-- }

-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.violet },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.black },
--   },

--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },

--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.black, bg = colors.black },
--   },
-- }

      local errors = {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        -- diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      }
      local warns = {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        -- diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      }
      local info = {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'info' },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        -- diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      }
      local hint = {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'hint' },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        -- diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      }
local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end
local lsp = {
  function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return ""
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return ""
  end,
  icon = ' ',
  colored = true,
  -- color = { fg = "#556575" }, -- gui = "italic"
}
local fn = {
        'filename', 
        file_status = true,
        path = 0,
        -- separator = { left = '' }, 
        right_padding = 0
      }

local cfg =  {
  active = true,
  options = {
    theme = "cayu",
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },

  },
  sections = {
    lualine_a = {
      fn,
    },
    lualine_b = { 
            'fileformat',
errors, warns, info, hint, 
    },
    lualine_c = { -- 'fileformat',
      'branch' ,
      gpsll,
    },
    lualine_x = {
      lsp,
      'location',
      -- ts,
    },
    lualine_y = { 'filetype', 'branch', 'diff'},
    lualine_z = {
      'progress'
    },
        },
  inactive_sections = {
    lualine_a = {fn},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  extensions = {},
  style = "lvim"
}

require "lualine".setup(cfg)
--   tabline = {},
-- }
