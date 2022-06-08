local lualine = require "lualine"
-- local ll_lsp = require "plugins.lline.comp.lsp"
local gps = require "nvim-gps"

local ayu = require "ayu.colors"

local colors = {
        rosewater = "#F5E0DC", -- Rosewater
        flamingo = "#F2CDCD", -- Flamingo
        magenta = "#dfbfff", -- Mauve
        pink = "#F5C2E7", -- Pink
        -- red = "#F28FAD", -- Red
        red="#f28779", -- ayu
        maroon = "#E8A2AF", -- Maroon
        orange = "#f29e74", -- Peach
        yellow = "#ffd173", -- Yellow
        green = "#d5ff80", -- Green
        blue = "#96CDFB", -- Blue
        cyan = "#89DCEB", -- Sky
        teal = "#B5E8E0", -- Teal
        violet = "#C9CBFF", -- Lavender
        white = "#D9E0EE", -- White
        -- fg = "#D9E0EE", -- White
        fg = ayu.fg,
        gray2 = "#C3BAC6", -- Gray2
        gray1 = "#988BA2", -- Gray1
        gray0 = "#6E6C7E", -- Gray0
        black5 = "#5c5b6f",
        black4 = "#575268", -- Black4
        -- black4 = "#101521", -- Black4
        black6 = "#47405a",
        black3 = "#302D41", -- Black3
        black2 = "#1E1D2F", -- Black2
        -- bg = "#1D1C2C", -- Black2
        -- bg = "#1a1823", -- Black2
        -- bg = "#101521", -- Black2
    -- bg = ayu.bg,
        bg = "#1c212b",
        black1 = "#1A1823", -- Black1
        black0 = "#131020", -- Black0
    }
--
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
local col = {
  n = colors.red,
  i = colors.green,
  v = colors.magenta,
  [''] = colors.blue,
  V = colors.blue,
  c = colors.magenta,
  no = colors.red,
  s = colors.orange,
  S = colors.orange,
  [''] = colors.orange,
  ic = colors.yellow,
  R = colors.violet,
  Rv = colors.violet,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.red,
  t = colors.red,
}

local l = {
  function()
    vim.api.nvim_command('hi! LualineMode guifg=' .. col[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return '▊'
  end,
  color = "LualineMode",
    colored=true,
  always_visible = true,
  padding = { left = 0, right = 1 },
}
local lsp_prog = {
    function() return vim.lsp.util.get_progress_messages() end,
}
local mode =  {
  -- mode component
  function()
    -- auto change color according to neovims mode
    vim.api.nvim_command('hi! LualineMode guifg=' .. col[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return ''
  end,
  color = 'LualineMode',
  padding = { right = 2 },
    always_visible = true,
}
local lllsp = {
    "lsp_progress",
    colored=true,
    color = { fg = colors.black4, bg = colors.bg },
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
    timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 }

}

local file =  {
  'filename',
    file_status = true,
    path = 0,
    -- color = "LualineMode",
    colored=true,
    color = {
        fg = colors.magenta,
        bg = colors.bg,
        gui = 'bold'
    },
    cond = conditions.buffer_not_empty,
    symbols = {
        -- modified = ''•,
        modified = '°',
        readonly = ' ',
        unnamed = '•',
    },
    shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
    padding = { right = 1 },
}
local gp = {
    gps.get_location,
    cond = gps.is_available,
    color = { fg = colors.black4, bg = colors.bg },
}
local idmap = {
        ["class"] = ' ',      -- Classes and class-like objects
        ["function"] = ' ',   -- Functions
        ["method"] = ' ',     -- Methods (functions inside class-like objects)
        ["tag"] = '炙',         -- Tags (example: html tags)
        ["table"] = ' ',
        ["array"] = ' ',
        ["module"] = ' ',
        ["container"] = ' ',
    }
local ty_patt = { 'class', 'function', 'method', 'struct', 'type', 'proc'}
local ts_ident = {
    icons_enabled = true,
    icon = '',
    function() return require("nvim-treesitter").statusline({
        indicator_size = 100,
        type_patterns = ty_patt,
        transform_fn = function(line)
            line:gsub("%s*[%[%(%{]*%s*$", "")
            for patt in ty_patt do
                line:gsub(patt, idmap[patt])
            end
        end,
        separator = ' › ',
    }) end,
    color = { fg = colors.black4, bg = colors.bg },
    always_visible = true,
    -- module->expression_statement->call->identifier
}
local git =  {
  'branch',
  -- icon = '',
  -- icon = ' ',
  icons_enabled = true,
  check_git_workspace = true,
  cond = conditions.check_git_workspace,
  color = { fg = colors.green, bg = colors.bg },
}

local prog = {
    'progress',
    color = { fg = colors.black4, bg = colors.bg},
    icon = '' ,
    icon_enabled = true,
    always_visible = false,
    cond = conditions.only_wide,
}

local loc = {
    "location",
    icon = "",
    icons_enabled=true,
    color = { fg = colors.black4, bg = colors.bg },
    cond = conditions.buffer_not_empty,
    always_visible = false,
    -- padding={left=0, right=1}
}
local sep= {
  function() return '%=' end,
    color = { fg = colors.black4, bg = colors.bg },
    colors = { fg = colors.black4, bg = colors.bg },
    colored = true,
}

local dir ={
    function() return " " .. vim.fn.expand("%:p:~"):gsub("/", "›") end,
    shorting_target = 20,
    color = { fg = colors.black4, bg = colors.bg , gui = 'italic'},
    always_visible = false,
    cond = conditions.only_wide,
    --     conditions.hide_in_width() & 
    --     conditions.buffer_not_empty 
    -- end,
}
-- local sig = {
--   function()
--         
--       local sig = require("lsp_signature").status_line(40)
--       -- return sig.label .. "🐼" .. sig.hint
--       return sig.label .. " " .. sig.hint
--     end,
--     -- icon="",
--     colored=true,
--     color = { fg = colors.black4, bg = colors.bg },
--     colors = { fg = colors.black4, bg = colors.bg },
--     cond = conditions.hide_in_width
-- }
local lsp=  {
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
  color = { fg = colors.black4, bg = colors.bg}, -- gui = "italic"
  cond = conditions.hide_in_width,
}


-- Add components to right sections
local enc =  {
  'o:encoding',
  -- fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { bg=colors.bg, fg = colors.green, gui = 'bold' },
    colored=true,
}


local localt =  { 'location',
    icons_enabled = true,
    colored = true,
    color = { fg = colors.black0,bg = colors.bg },
    padding={left=0, right=0},
    icon = ""
}
local diag={
    'diagnostics',
    sections = { 'error', 'warn', 'info' },
    sources = { 'nvim_lsp',  'nvim_diagnostic' },
    -- sources = { "nvim_diagnostic" },
    symbols = { error = '  ', warn = '  ', info = '  ' },
    -- symbols = { error = "•", warn = "•", info = "•" },
    update_in_insert = false,
    diagnostics_color = {
        error = { fg = colors.red},
        warn = { fg = colors.orange},
        info = { fg = colors.blue},
        color_error = { fg = colors.red},
        color_warn = { fg = colors.orange},
        color_info = { fg = colors.blue},
    },
    cond = conditions.buffer_not_empty,
    colored=true,
    color = { bg = colors.bg },
    update_in_insert = false, -- Update diagnostics in insert mode.
    always_visible = true,   -- Show diagnostics even if there are none.
      -- padding = { left = 1, right = 1}

}
local ff = {
  'fileformat',
    fmt = function(s)
        vim.cmd('hi! LualineMode guifg=' .. col[vim.fn.mode()] .. ' guibg=' .. colors.bg)
        return s
      end,
    icon_enabled = true,
    symbols = {
        unix = '', -- e712
        dos = '',  -- e70f
        mac = '',  -- e711
      },
    colored=true,
    color = "LualineMode"
}
local diff ={
  'diff',
  -- symbols = { added = "•", modified = "•", removed = "•" },
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  -- symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  -- symbols = { added = ' ', removed = ' ' },
  -- symbols = { added = '+', modified = '±', removed = '-' },
      -- symbols = { added = "", modified = "", removed = "" },
  -- separator = { left = '', right = ''},
  diff_color = {
    added = { fg = colors.green, bg=colors.bg},
    modified = { fg = colors.orange, bg=colors.bg},
    removed = { fg = colors.red, bg=colors.bg},
  },
    colored=true,
    color = { bg = colors.bg },
  cond = conditions.buffer_not_empty,
  always_visible = true,
}

local ft = {
  'filetype',
  -- fmt = string.upper,
    fmt = function(s)
        vim.cmd('hi! LualineMode guifg=' .. col[vim.fn.mode()] .. ' guibg=' .. colors.bg)
        return s
      end,
    colored = true,
    icons_enabled = true,
    color = "LualineMode",
  -- icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
    -- fg = colors.red,
    -- gui = 'bold',
    --
}

local r = {
  function()
    vim.api.nvim_command('hi! LualineMode guifg=' .. col[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return '▊'
  end,
    colored=true,
  color = 'LualineMode',
  padding = { left = 1 },
}

-- {'  ' }
local themedef = { fg = colors.fg, bg = colors.bg }

local tabs = {
    'tabs',
    max_length = vim.o.columns / 3,
    mod = 0,
    tabs_color = {
        active = { fg = colors.fg, gui="bold", bg=colors.black2 },
        inactive = { fg = colors.gray0, bg=colors.black0}
--
    }
}

return  {
  options = {
    -- Disable sections and component separators
    icons_enabled=true,
    component_separators = '',
    always_divide_middle = true,
    globalstatus = true,
    section_separators = '',
    disabled_filetypes = {
            "help",
            "man",
            "NvimTree",
            -- "toggleterm",
        'alpha',
        'Outline',
        -- 'ToggleTerm',
        'NvimTree',
        'dbui',
        'packer',
        'dapui_scopes',
        'dapui_stacks',
        'dapui_breakpoints',
        'dapui_watches'
    },
    -- theme="ayu_mirage",
    -- theme = themedef,
    theme = {
      normal = {
            a = themedef,
            b = themedef,
            c = themedef,
            x = themedef,
            y = themedef,
            z = themedef,
        },
      inactive = {
            a = themedef,
            b = themedef,
            c = themedef,
            x = themedef,
            y = themedef,
            z = themedef,
        },
    },
  },
    tabline = {
        -- lualine_a = { 
        -- {
        --     "buffers",
        --     buffers_color = {
        --         active = { fg = colors.fg, gui="bold", bg=colors.black2 },
        --         inactive = { fg = colors.black4, bg=colors.black0}
        --     }
        -- },
        -- },
        -- lualine_z = { tabs }
    },
  sections = {
    -- these are to remove the defaults
    lualine_a = {l, mode},
    lualine_b = {file},
    -- lualine_c = {diag, lsp, sep, dir},
    lualine_c = {diag, lsp, gp, sep},
    -- lualine_x = {loc, prog},
    -- lualine_y = {dir, git, diff},
    -- lualine_x = {dir, sig, loc, prog},
    lualine_x = {dir, loc, prog},
    lualine_y = {git, diff},
    lualine_z = {ft, ff, r},
    -- These will be filled later
    -- lualine_c = { l, mode, file, git, prog, loc, diff, sep, dir},
    -- lualine_x = { lsp, diag, ft, r},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {l, mode},
    lualine_b = {file},
    lualine_c = {sep, },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {ft, r},
  },
  extensions = {
    "nvim-tree",
    "quickfix",
    "symbols-outline",
    "fzf",
    "toggleterm",
    "aerial",
  }
}
