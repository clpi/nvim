local o = vim.o
o.swapfile = false
o.termguicolors = true
o.linebreak = true
o.splitbelow=true
o.splitright = true
o.smartindent=true
o.expandtab=true
o.wrap = true
o.pumblend=10
o.shiftround =true
o.winblend=8
o.inccommand = "nosplit"
o.infercase=true
o.pumheight = 0
o.pumwidth = 17
o.cmdheight=1
o.hlsearch = true
-- o.inccommmand = "nosplit"
o.incsearch = true
o.showmode = false
o.magic = true
o.showmode = false
o.showfulltag = true
o.showmatch = true
o.autoread = true
o.warn = false
o.confirm = false
o.title = true
o.foldenable = false
o.makeprg = "just \\$*"
o.copyindent = true
o.hidden = true
o.undofile = true
o.wildmode = "full"
o.wildoptions = "tagfile,pum"
o.preserveindent = true
o.cindent = true
o.joinspaces = false
o.matchtime = 10

o.relativenumber = false

o.shiftwidth = 0
o.autochdir = true
o.list = true
o.autoindent = true
o.clipboard="unnamedplus,unnamed"
o.redrawtime = 300
o.signcolumn = "yes:1"
o.numberwidth=3
-- o.formatoptions:append('j')
-- o.formatoptions:append('r')
-- o.formatoptions:append('a')
-- o.formatoptions:append('o')
-- o.shortmess = {
--   t = true,
--   A = true,
--   o = true,
--   O = true,
--   T = true,
--   f = true,
--   F = true,
--   s = true,
--   c = true,
--   w = true,
-- }
-- o.listchars = {
--     tab = '▏ ',
--     trail = '·',
--     -- nbsp = '⍽',
--     extends = '>',
--     precedes = '<',
-- }
-- o.fillchars = {
--     eob = ' ',
-- }
o.sidescrolloff=2
o.ruler=true
o.tabstop = 4
o.modeline=true
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 120
o.foldnestmax = 4
o.foldmethod = "expr"
o.foldminlines = 1
o.softtabstop = 0
o.undofile = true
o.undodir =  vim.fn.expand(vim.fn.stdpath('data') .. '/undo//')
o.titlelen = 64
o.titlestring = "Neovim: %f %m"
o.virtualedit = 'onemore'

o.cursorline=true
o.smarttab = true
o.formatoptions="l"
-- o.switchbuf="useopen,newtab,usetab"

o.lazyredraw = true
o.conceallevel=2
o.concealcursor="nc"
o.showtabline=2
o.undolevels=1500
o.belloff='all'
o.mousefocus = true
o.laststatus=3
vim.g.modelines = 0
o.grepprg = 'rg\\ --hidden\\ --vimgrep\\ --smart-case\\ --no-heading'
--Make line numbers default
vim.wo.number = true


--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect,preview'


vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.g.zig_fmt_autosave = 0
