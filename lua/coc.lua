-- NOTE: Alternate plugin setup for coc.nvim

local packer = require("plug.packer").init()

packer.startup({function(use)
  -- use 'lewis6991/impatient.nvim'
  use 'wbthomason/packer.nvim' -- Package manager
  use { "ibhagwan/fzf-lua", config = function()
    require("plug.fzflua")
  end }
  use { "nvim-lua/plenary.nvim" }
  -- use { 'tversteeg/registers.nvim', keys = { { 'n', '"' }, { 'i', '<c-r>' } } }
  -- use(plug.nim)
  use {'tamago324/nlsp-settings.nvim', config = function()
    require("nlspsettings").setup({
      config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
      local_settings_dir = ".nlsp-settings",
      local_settings_root_markers = { '.git' },
      append_default_schemas = true,
      loader = 'json'
    })
  end}
  use 'onsails/lspkind.nvim'
  use 'moll/vim-bbye'
  --
use {"simrat39/rust-tools.nvim",
  config = function()
    require("rust-tools").setup({
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
        use_telescope = true,
        },
    },
    server = {
        cmd = { vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer" },
        -- on_attach = require("lvim.lsp").common_on_attach,
        -- on_init = require("lvim.lsp").common_on_init,
    },
  })
end,
ft = { "rust", "rs" },
}
  use 'rcarriga/nvim-notify'
  use { "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_enabled = 1
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_matchparen_deferred = 1
    end,
  }
  use { "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      -- require("user.todo_comments").config()
    end,
    event = "BufRead",
  }
  use { 'nvim-lua/popup.nvim' }
  use {'numToStr/Comment.nvim', config = function()require'Comment'.setup()end}
  use {"antoinemadec/FixCursorHold.nvim"}
  use { 'nvim-telescope/telescope.nvim',
    requires = { 
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = "make"},
      { "nvim-telescope/telescope-project.nvim", },
      { "jvgrootveld/telescope-zoxide" },
      { "nvim-telescope/telescope-github.nvim"},
      -- { "LinArcX/telescope-command-palette.nvim" }
      -- {'dhruvmanila/telescope-bookmarks.nvim', requires = 'tami5/sqlite.lua'},
      -- { 'nvim-telescope/telescope-symbols.nvim' },
      -- { "nvim-neorg/neorg-telescope" }
      -- {'nvim-telescope/telescope-ui-select.nvim' }
      -- {"nvim-telescope/telescope-file-browser.nvim", opt = true },
    },
    config = function() require("plug.telescope") end,
  }
  -- use {
  --   'pwntester/octo.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --   config = function ()
  --     require"octo".setup()
  --   end
  -- }
  -- use {"gfeiyou/command-center.nvim", requires = "telescope.nvim"}
  use { 'b0o/schemastore.nvim'}
  use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  use {'nvim-lualine/lualine.nvim',
    config = "require'plug.lualine'",--function() require("plug.lualine") end,
    require = { "SmiteshP/nvim-gps" }
  }
 --  use({
 --    'ThePrimeagen/harpoon',
 --    event = 'BufRead',
 --    config = function()
 --      require('harpoon').setup({})
 --    end,
	-- })

  use {'lukas-reineke/indent-blankline.nvim', config=function()
    require "plug.indent".setup()
  end}
  use { "ethanholz/nvim-lastplace", event = "BufRead",
    config = function() require("plug.lastplace") end,
  }
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("plug.gitsigns")
    end,
  }
  use {"folke/lua-dev.nvim", config = function()
    -- require("usr.plug.luadev").setup()
  end}
  use { "akinsho/toggleterm.nvim", config = "require'plug.term'"}
  use { 'VonHeikemen/searchbox.nvim',
    requires = { 'MunifTanjim/nui.nvim' }
  }
  -- use({ 'nanotee/sqls.nvim' })
  use 'jose-elias-alvarez/null-ls.nvim'

  use {'nvim-treesitter/nvim-treesitter', 
    run = ":TsUpdate",
    before = { "orgmode", "neorg" },
    requires = {
			{ 'RRethy/nvim-treesitter-endwise', event = 'InsertEnter' },
      { 'RRethy/nvim-treesitter-textsubjects' },
      {'nvim-treesitter/nvim-treesitter-refactor',},
      { 'nvim-treesitter/nvim-treesitter-textobjects', event = "BufRead"},
      {"romgrk/nvim-treesitter-context"},
      {"nvim-treesitter/playground"},
      {"JoosepAlviste/nvim-ts-context-commentstring"},
      {"windwp/nvim-ts-autotag", event = "InsertEnter", config = function()
          require("nvim-ts-autotag").setup()
        end,
      }
      
    }
  }
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use {'williamboman/nvim-lsp-installer', config = function()
    require("plug.lspinstall")
  end}
  -- use {'hrsh7th/nvim-cmp'}
  use {'folke/which-key.nvim', config = function()
    require("plug.whichkey")
  end}
  -- use({
  --   'ThePrimeagen/refactoring.nvim',
  --   requires = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  --   event = 'BufRead',
  --   config = function()
  --     require('refactoring').setup({})
  --   end,
  -- })
  -- use({
  --   'danymat/neogen',
  --   after = 'nvim-treesitter',
  --   config = function()
  --     require('neogen').setup({
  --       enabled = true,
  --       snippet_engine = 'luasnip',
  --     })
  --   end,
		-- })

  -- use { "hrsh7th/cmp-nvim-lsp-signature-help"}
  -- use({ 'ray-x/cmp-treesitter', after = 'nvim-cmp' })
	-- use({ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' })
	-- use({ 'petertriho/cmp-git', after = 'nvim-cmp' })
	-- use({ 'zbirenbaum/copilot-cmp', after = { 'copilot.lua', 'nvim-cmp' } })
  -- use { 'rafamadriz/friendly-snippets' }
  -- use { "hrsh7th/cmp-nvim-lsp-document-symbol"}
  -- use {'hrsh7th/cmp-nvim-lsp'}
  -- use {'hrsh7th/cmp-nvim-lua'}
  -- use {"dmitmel/cmp-cmdline-history"}
  -- use { 'hrsh7th/cmp-buffer' }
  -- use { 'hrsh7th/cmp-path' }
  -- use { 'hrsh7th/cmp-cmdline' }
  -- use { 'saadparwaiz1/cmp_luasnip'}
  -- use { "Saecki/crates.nvim",
  --     event = { "BufRead Cargo.toml" },
  --     after = { "nvim-cmp" },

  -- }
  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "kevinhwang91/nvim-bqf", ft = 'qf', config = function()
      require("plug.bqf")
  end}
  -- use "tpope/vim-dadbod"
  -- use {"kristijanhusak/vim-dadbod-completion", event = "InsertCharPre"}
  -- use "kristijanhusak/vim-dadbod-ui"
  use { "ray-x/go.nvim", ft = "go", config = function()
      require('go').setup()
  end}
  use { "windwp/nvim-autopairs", config = function()
      require("plug.autopairs")
  end}
  use { "kyazdani42/nvim-tree.lua",
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require("plug.nvimtree") end,
  }
      -- config = function() require("plugins.nvim-tree") end,
  --   -- REPLs
  use {
    'hkupty/iron.nvim',
    setup = function()
      vim.g.iron_map_defaults = 0
    end,
    config = [[require('config.iron')]],
    cmd = { 'IronRepl', 'IronSend', 'IronReplHere' },
  }
  use {
    "karb94/neoscroll.nvim", 
    config = function()
      require'plug.neoscroll'
    end,
  }
  use {'akinsho/bufferline.nvim',
    config = function() require("bufferline").setup({}) end,
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use({
    'mfussenegger/nvim-dap',
    requires = {'rcarriga/nvim-dap-ui', 'theHamsta/nvim-dap-virtual-text',},
    event = 'bufreadpre',
    config = function()
      -- require('plugins.dap')
    end,
  })
  -- use 'nvim-neo-tree/neo-tree.nvim',
  use({
    'Pocco81/DAPInstall.nvim',
    event = 'BufReadPre',
  })
  use { "jose-elias-alvarez/nvim-lsp-ts-utils"}
  use { "alaviss/nim.nvim", ft = "nim"}
  use {"akinsho/flutter-tools.nvim", ft = "dart", config =
      function() require("flutter-tools").setup{} end}
  use {'ziglang/zig.vim', ft="zig"}
  use { "peterhoeg/vim-qml", ft = { "qml" }}
  use { "SmiteshP/nvim-gps",
    config = function() require("plug.gps") end,
  }
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use {"folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use {'vimwiki/vimwiki', 
    branch = "dev", 
    config = function() require("plug.vimwiki") end
  }
  use {"ahmedkhalf/project.nvim", config = function()
      require("project_nvim").setup {}
  end}
  use {"ggandor/lightspeed.nvim",event = "BufRead"}
  use {"kosayoda/nvim-lightbulb", config = function() end,event = "BufRead"}
  use {"norcalli/nvim-colorizer.lua", config = function() require("plug.colorizer") end}
  use { 
    "github/copilot.vim", 
    config = function() require("plug.copilot") end,
  }
  use{'j-hui/fidget.nvim',config=function()
      require("fidget").setup()
  end}

  use {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  }

  use {
    "nathom/filetype.nvim",
    config = function()
      -- require("user.filetype").config()
    end,
  }
  use {
    "simrat39/symbols-outline.nvim",
    setup = function()
      -- require("user.symbols_outline").config()
    end,
    event = "BufReadPost",
    -- disable = lvim.builtin.tag_provider ~= "symbols-outline",
  }
  use {"stevearc/dressing.nvim", config = function()

  end}
  use { "nvim-lua/lsp_extensions.nvim" }
  use { "weilbith/nvim-code-action-menu",
    cmd = 'CodeActionMenu',
    config = function() require("plug.codeaction")
  end,
  }

    -- use { 'rcarriga/vim-ultest', requires={'vim-test/vim-test'}, run=":UpdateRemotePlugins"}
  use {'Olical/conjure', }
  -- use {
  --     "nvim-neorg/neorg",
  --     tag = "latest",
  --     -- ft = "norg",
  --     -- after = {"nvim-treesitter", "telescope.nvim"},
  --     config = function()
  --       require("plug.neorg").setup()
  --   end
  -- }
  use {'purescript-contrib/purescript-vim', ft = "purescript"}
  -- use {
  --   event = "BufWinEnter",
  --   setup = function()
  --     vim.cmd [[packadd telescope.nvim]]
  --   end,
  -- }
  -- use {
  --   "ipod825/igit.nvim",
	    -- requires = { "nvim-lua/plenary.nvim", "ipod825/libp.nvim" },
  --   config = function()
  --     require("igit").setup()
  --   end,
  -- }

  use {'NoahTheDuke/vim-just', ft =
    {"justfile", "Justfile", "just", "*.just", "*.justfile"}
  }

  -- use { "jubnzv/mdeval.nvim", config = function()
  --   require("mdeval").setup()
  -- end}
  use { "tpope/vim-repeat" }
  use {'nvim-orgmode/orgmode',
    ft = {'org'},
    config = function() require('plug.org') end
  }
  use { "jakewvincent/mkdnflow.nvim",
    ft = {"markdown", "*.md", "vimwiki.markdown"},
    config = function() require("plug.mkdnflow") end,
  }
  use { "~/nv/cayu" , config = function()
    vim.g.cayu_style = "night"
    vim.g.cayu_italic_functions = true
    vim.g.cayu_sidebars = { "Trouble", "NvimTree", "qf", "vista_kind", "terminal", "packer" }
  end}
  use { "~/nv/exi.lua", config = function()
  end}
  use { "kevinhwang91/nvim-hlslens", config = function()
		require('hlslens').setup()
  end}
  -- use {"nvim-pack/nvim-spectre"}
  -- use 'junegunn/vim-easy-align'
  -- use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }


  -- use { "ray-x/lsp_signature.nvim",
  --   config = function() require "lsp_signature".on_attach() end,
  --   event = "BufRead"
  -- }
  -- use 'tpope/vim-fugitive' -- Git commands in nvim
  -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- use {'EdenEast/nightfox.nvim'}
end,
  -- config = {
    -- display = {
      -- open_fn = function()
        -- return require("packer.util").float {
          -- border = "single"
        -- }
      -- end

    -- }

  -- }
})

vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- DISABLE REMOTE PLUGINS
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
