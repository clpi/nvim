local ok_gps, gps = pcall(require, "nvim-gps")
if not ok_gps then return end

local gpsll = {
  gps.get_location,
  cond = gps.is_available,
  left_padding = 1
}

local aerial = { "aerial",
  sep = ' ) ',
  depth = nil,
  dense = false,
  dense_sep = '.',
}

local search_result = function()
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
local filen = {
  "filename",
    symbols = {
        modified = '°',
        readonly = ' ',
        unnamed = '•',
    },
    icons_enabled = true,
    shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
    colored=true,
    path = 0,
    padding ={ right = 0},
    file_status = true,
    cond = conditions.buffer_not_empty,
}
local git =  {
  'branch', -- icon = ' ',
  icons_enabled = true,
  check_git_workspace = true,
  cond = conditions.check_git_workspace,
  -- color = { fg = colors.green, bg = colors.bg },
}

local prog = {
    'progress',
    icon = '' ,
    icon_enabled = true,
    always_visible = false,
    cond = conditions.only_wide,
}

local loc = {
    "location",
    icon = "",
    icons_enabled=true,
    cond = conditions.buffer_not_empty,
    always_visible = false,
    -- padding={left=0, right=1}
}
local sep= {
  function() return '%=' end,
  colored = false,
  always_visible = false,
}

local dir ={
    function() return " " .. vim.fn.expand("%:p:~"):gsub("/", " › ") end,
    shorting_target = 20,
    always_visible = false,
    cond = conditions.only_wide,
    --     conditions.hide_in_width() & 
    --     conditions.buffer_not_empty 
    -- end,
}
local lsp = {
  function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    local out = ""
    local c = 0
    if next(clients) == nil then
      return ""
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        if c == 0 then
          out = out .. client.name
        else
          out = out .. " " .. client.name
        end
      end
      c = c + 1
    end
    return out
  end,
  icon = ' ',
  colored = true,
  -- color = { fg = "#556575" }, -- gui = "italic"
}

local localt =  { 'location',
    icons_enabled = true,
    colored = true,
    padding={left=0, right=0},
    icon = ""
}
local diag={
    'diagnostics',
    sections = { 'error', 'warn', 'info', 'hint' },
    sources = { 'nvim_lsp',  'nvim_diagnostic' },
    symbols = { error = '  ', warn = '  ', info = '  ' },
    -- symbols = { error = "•", warn = "•", info = "•" },
    update_in_insert = false,
    cond = conditions.buffer_not_empty,
    colored=true,
    -- always_visible = true,   -- Show diagnostics even if there are none.
      -- padding = { left = 1, right = 1}

}
local diff ={
  'diff',
  -- symbols = { added = "•", modified = "•", removed = "•" },
	-- symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
      -- symbols = { added = "", modified = "", removed = "" },
  -- separator = { left = '', right = ''},
  colored=true,
  cond = conditions.buffer_not_empty,
  always_visible = true,
}
local ff = {
  'fileformat',
    icon_enabled = true,
    cond = conditions.buffer_not_empty,
    colored=false,
}
local ft_icon = {
  'filetype',
  icon_only = true,
  colored = false,
}
local ft_name = {
  'filetype',
  icon_only = false,
  icons_enabled = false,
  colored = false,
}

local cfg =  {
  active = true,
  options = {
    theme = "cayu",
    globalstatus=true,
    icons_enabled = true,
    always_divide_middle=true,
    disabled_filetypes = {
      'NvimTree', 'ToggleTerm',
    },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },

  },
  sections = {
    lualine_a = { ft_icon, filen },
    lualine_b = {   errors, warns, info, hint },
    lualine_c = { gpsll, sep},
    lualine_x = { lsp, prog, }, --ts
    lualine_y = { git,  diff},
    lualine_z = { ft_name },
        },
  inactive_sections = {
    lualine_a = {filen},
    lualine_b = {  },
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
