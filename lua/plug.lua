local packer = require("plug.packer").preinit()

-- @in str [require-path] @out void [sources relpath]
local cfg = function(relpath) require(relpath) end
-- @in str [require path] @in table? [optional setup table for require path]
local cfg_setup = function(relpath, setup_opts)
  if setup_opts then require(relpath).setup(setup_opts) end
end

packer.startup({function(use)
  -- --  NOTE: :: @META   Anything related to meta-nvim-ops necessary at front  |--
  --
  --
  --
  --
  use "nvim-lua/plenary.nvim"
  use 'wbthomason/packer.nvim' -- Package manager
  -- use 'lewis6991/impatient.nvim'
  --
  --
  -- --  NOTE: :: @PICK   Pickers and fuzzy finders                             |--
  --
  --
  --
  --
  --
  use { "ibhagwan/fzf-lua", config = function()
    require("plug.fzflua")
  end }
  -- use { 'tversteeg/registers.nvim', keys = { { 'n', '"' }, { 'i', '<c-r>' } } }
  -- use(plug.nim)
  -- --  NOTE: :: @LSP    LSP extensions, providers, etc.                   |--
  --use { __ NOTE: SHOULD BE DEPRECATED
--   'rmagatti/goto-preview',
--   config = function()
--     require('goto-preview').setup {}
--   end
-- }

  use {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
    vim.cmd[[
      nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
      nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
      nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
      nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
      ]]
    end
  }
  -- use { "ray-x/lsp_signature.nvim",
  --   config = function() require "lsp_signature".on_attach() end,
  --   event = "BufRead"
  -- }
  use {'tamago324/nlsp-settings.nvim', config = function()
    require("nlspsettings").setup({
      config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
      local_settings_dir = ".nlsp-settings",
      local_settings_root_markers = { '.git' },
      append_default_schemas = true,
      loader = 'json'
    })
  end}
  --
  --
  --
  --
  --
  use 'onsails/lspkind.nvim'
  -- --  NOTE: :: @UI     UI additions, fuzzy finders, libraries            |--
  use {'folke/which-key.nvim', config = function()
    require("plug.whichkey")
  end}
  --
  --
  --
  --
  --
  use {"stevearc/dressing.nvim", config = function()

  end}
  -- use {
  --   "windwp/nvim-spectre",
  --   event = "BufRead",
  --   config = function()
  --     require("spectre").setup()
  --   end,
  -- }

  use {'Julian/lean.nvim', config = function()
    require("plug.lean").setup()
  end}
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
      {'dhruvmanila/telescope-bookmarks.nvim', requires = 'tami5/sqlite.lua'},
      {"crispgm/telescope-heading.nvim"},
      -- { "nvim-neorg/neorg-telescope" }
        -- "nvim-telescope/telescope-media-files.nvim",
      -- { "LinArcX/telescope-command-palette.nvim" }
      -- {'nvim-telescope/telescope-ui-select.nvim' }
        -- { "nvim-telescope/telescope-dap.nvim" },
      -- {"nvim-telescope/telescope-file-browser.nvim", opt = true },
    },
    config = function() require("plug.telescope") end,
  }
  -- use {'pwntester/octo.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --   config = function ()
  --     require"octo".setup()
  --   end}
  -- use {"gfeiyou/command-center.nvim", requires = "telescope.nvim"}
  use { 'b0o/schemastore.nvim'}
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
  use { "junegunn/vim-easy-align", event = "BufReadPost" }
  -- use { "antoinemadec/FixCursorHold.nvim", event = "BufReadPost" }
  use { "akinsho/toggleterm.nvim", config = "require'plug.term'"}
  use { 'VonHeikemen/searchbox.nvim',
    requires = { 'MunifTanjim/nui.nvim' }
  }
  use({ 'nanotee/sqls.nvim', config = function() require"plug.sqls" end })
  use {'jose-elias-alvarez/null-ls.nvim', 
    config = function()
      require("plug.null-ls")
    end,
  }

  use {'nvim-treesitter/nvim-treesitter', 
    run = ":TSUpdate",
    before = { "orgmode", "neorg" },
    requires = {
			{ 'RRethy/nvim-treesitter-endwise', event = 'InsertEnter' },
      {'nvim-treesitter/nvim-treesitter-textobjects'},
      { 'RRethy/nvim-treesitter-textsubjects' },
      {'nvim-treesitter/nvim-treesitter-refactor',},
      { 'nvim-treesitter/nvim-treesitter-textobjects', event = "BufRead"},
      {"romgrk/nvim-treesitter-context"},
      {"nvim-treesitter/playground"},
      {"JoosepAlviste/nvim-ts-context-commentstring"},
      { "windwp/nvim-autopairs", config = function()
        require("plug.autopairs")
      end},
      {"windwp/nvim-ts-autotag", event = "InsertEnter", config = function()
          require("nvim-ts-autotag").setup({
            filetypes = { 
              "html", "xml", "svelte", 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'glimmer',
              'handlebars','hbs'
            }
        })
        end,
      }
    }
  }
  use 'neovim/nvim-lspconfig'
  use {'williamboman/nvim-lsp-installer', config = function()
    require("plug.lspinstall")
  end}
  -- use({
  --   'ThePrimeagen/refactoring.nvim',
  --   requires = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  --   event = 'BufRead',
  --   config = function()
  --     require('refactoring').setup({})
  --   end,
  -- })
use({
  'danymat/neogen',
  after = 'nvim-treesitter',
  config = function() require("plug.neogen") end,
})

  use { 'rafamadriz/friendly-snippets' }



  -- @TODO NOTE: :: File-specific plugins ::::::::::::::::::::::::::::::------------
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
  use { "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      after = { "nvim-cmp" },
      config = function() require('plug.crates') end,
  }
  use { "tpope/vim-surround", keys = { "c", "d", "y" } }
  use { "kevinhwang91/nvim-bqf", ft = 'qf', config = function()
      require("plug.bqf")
  end}
  -- use 'renerocksai/telekasten.nvim'
  use {"tpope/vim-dadbod"}
  use {"kristijanhusak/vim-dadbod-completion", 
    event = "InsertCharPre",
    config=function()require"plug.dadbod"end,
  }
  use {"kristijanhusak/vim-dadbod-ui"}
  use { "ray-x/go.nvim", ft = "go", config = function()
      require('go').setup()
  end}
  use { "kyazdani42/nvim-tree.lua",
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require("plug.nvimtree") end,
  }
  use { "stevearc/aerial.nvim", config = function() require("plug.aerial") end }
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
    event = 'bufreadpre',
    requires = {
      { 'Pocco81/DAPInstall.nvim', event = 'BufReadPre', },
        {'rcarriga/nvim-dap-ui'},-- config=function()require("plug.dapui")end},
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      -- require('plugins.dap')
    end,
  })
  -- use 'nvim-neo-tree/neo-tree.nvim',
  use { "jose-elias-alvarez/nvim-lsp-ts-utils"}
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
  use {"ggandor/lightspeed.nvim",event = "BufRead"}
  use {"kosayoda/nvim-lightbulb", config = function() end,event = "BufRead"}
  use {"norcalli/nvim-colorizer.lua", config = function() require("plug.colorizer") end}
  use{'j-hui/fidget.nvim',config=function()
      require("fidget").setup()
  end}

  use {
    "simrat39/symbols-outline.nvim",
    setup = function()
      -- require("user.symbols_outline").config()
    end,
    event = "BufReadPost",
    -- disable = lvim.builtin.tag_provider ~= "symbols-outline",
  }
  use { "nvim-lua/lsp_extensions.nvim" }
  use { "weilbith/nvim-code-action-menu",
    cmd = 'CodeActionMenu',
    config = function() require("plug.codeaction")
  end,
  }
  -- --  NOTE: :: @TSIT   Treesitter related plugins                        |--
  -- --  NOTE: :: @CMP    Completion plugins                                |--
  use {'hrsh7th/nvim-cmp',
    requires = {
      { "hrsh7th/cmp-nvim-lsp-signature-help"},
      { "hrsh7th/cmp-nvim-lsp-document-symbol"},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {"dmitmel/cmp-cmdline-history"},
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip'},
      { 'David-Kunz/cmp-npm', 
        config = function()
          require("cmp-npm").setup({
            ignore= { },
            only_semantic_token=false,
          })
      end
      }
      -- "octa(ltree/cmp-look",
        -- "hrsh7th/cmp-calc",
        -- "f3fora/cmp-spell",
        -- "hrsh7th/cmp-emoji",
      -- use({ 'ray-x/cmp-treesitter', after = 'nvim-cmp' })
	    -- use({ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' })
	    -- use({ 'petertriho/cmp-git', after = 'nvim-cmp' })
	    -- use({ 'zbirenbaum/copilot-cmp', after = { 'copilot.lua', 'nvim-cmp' } })
    }
  }
  use {"github/copilot.vim",config = function() require("plug.copilot") end,}
  -- --  NOTE: :: @GIT    Git/VCS helpers and browsers                      |--
  -- --  NOTE: :: @FT     Filetype helpers, providers                       |--
  use { "alaviss/nim.nvim", event = "BufRead", ft = "nim"}
  use {"akinsho/flutter-tools.nvim", 
    event = "BufRead", ft = "dart", config =
      function() require("flutter-tools").setup{} end}
  use {'ziglang/zig.vim', event = "BufRead", ft="zig"}
  use { "peterhoeg/vim-qml", event = "BufRead", ft = { "qml" }}
  use {'dkarter/bullets.vim', config=function()
    vim.g.bullets_set_mappings = 0
    vim.g.bullets_mapping_leader = '<C-b>'
    vim.g.bullets_max_alpha_characters = 2
    vim.g.bullets_pad_right = 1
    vim.g.bullets_line_spacing = 1
    vim.g.bullets_delete_last_bullet_if_empty = 1
    vim.g.bullets_enabled_file_types = {
      "markdown", "vimwiki", "pandoc", "org", "norg", "vimwiki.markdown.pandoc", "rst",
      "gitcommit", "scratch", "text"
    }
  end}

  --
  --
  --
  --
    -- use { 'rcarriga/vim-ultest', requires={'vim-test/vim-test'}, run=":UpdateRemotePlugins"}
  use {
      "nvim-neorg/neorg",
      opt = true,
      tag = "latest",
      ft = "norg",
      setup = vim.cmd("autocmd BufRead,BufNewFile *.norg setlocal filetype=norg"),
      after = {"nvim-treesitter", "telescope.nvim"},
      config = function() require("plug.neorg").setup() end,
      requires = { "nvim-neorg/neorg-telescope", ft = { "norg" } },
  }
  use {'Olical/conjure', ft={"clojure", "scheme", "emacslisp", "commonlisp", "racket", "hy"}}
  use {'purescript-contrib/purescript-vim', ft = "purescript"}
  use {'hylang/vim-hy', ft = "hy"}
  use { "vim-crystal/vim-crystal", ft = { "crystal" } }
  use {'NoahTheDuke/vim-just', ft =
    {"justfile", "Justfile", "just", "*.just", "*.justfile"}

  }
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
  -- }

  --
  --
  -- NOTE: :: @MISC :: Miscellaneous essentials and quirk-fixers         |--
  --
  --
  -- NOTE: :: @COLORS :: Neovim colorschemes ::::::::::::::::::::::::::::::::
  use {"~/nv/cayu" , config = function()
    vim.g.cayu_style = "night"
    vim.g.cayu_italic_functions = true
    vim.g.cayu_sidebars = { "Trouble", "NvimTree", "qf", "vista_kind", "terminal", "packer" }
  end}
  -- use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  --
  --
  use 'moll/vim-bbye'
  -- NOTE: :: @ORG ::  Task organization, scheudling :::::::::::::::::::::::::
  --
  --
  --
  use {'lukas-reineke/headlines.nvim', config = function()
    require('headlines').setup()
  end}
  use {
  'chipsenkbeil/distant.nvim',
  config = function()
    require('distant').setup {
      ['*'] = require('distant.settings').chip_default()
    }
  end
}
  use { 'tami5/lspsaga.nvim', config = function() 
    --require("plug.lspsaga") 
  end}  -- nightly
  use { "gfanto/fzf-lsp.nvim", config = function()
    vim.lsp.handlers["textDocument/codeAction"] = require'fzf_lsp'.code_action_handler
    vim.lsp.handlers["textDocument/definition"] = require'fzf_lsp'.definition_handler
    vim.lsp.handlers["textDocument/declaration"] = require'fzf_lsp'.declaration_handler
    vim.lsp.handlers["textDocument/typeDefinition"] = require'fzf_lsp'.type_definition_handler
    vim.lsp.handlers["textDocument/implementation"] = require'fzf_lsp'.implementation_handler
    vim.lsp.handlers["textDocument/references"] = require'fzf_lsp'.references_handler
    vim.lsp.handlers["textDocument/documentSymbol"] = require'fzf_lsp'.document_symbol_handler
    vim.lsp.handlers["workspace/symbol"] = require'fzf_lsp'.workspace_symbol_handler
    vim.lsp.handlers["callHierarchy/incomingCalls"] = require'fzf_lsp'.incoming_calls_handler
    vim.lsp.handlers["callHierarchy/outgoingCalls"] = require'fzf_lsp'.outgoing_calls_handle

  end}
  use { "itchyny/calendar.vim" }
  use {'vimwiki/vimwiki', 
    branch = "dev", 
    config = function() require("plug.vimwiki") end
  }
  use {"ahmedkhalf/project.nvim", config = function()
      require("project_nvim").setup {}
  end}
  -- use { "jubnzv/mdeval.nvim", config = function()
  --   require("mdeval").setup()
  -- end}
  use { "tpope/vim-repeat" }
  use {'nvim-orgmode/orgmode',
    ft = {'org'},
    config = function() require('plug.org') end,
    requires = {
      use {"akinsho/org-bullets.nvim", config = function()
        require("org-bullets").setup {
          symbols = { "◉", "○", "✸", "✿" },
        }
      end}
    }
  }
  use { "clpi/exi.lua", config = function()
    vim.g.exi_enable = true
    vim.g.exi_ixi_ext = true
    vim.g.exi_md_ext = false
  end}
  -- @NOTE doesn't work with vimwiki
  -- use {
  --   'jghauser/follow-md-links.nvim', config = function()
  --        vim.keymap.set('n', '<bs>', ':edit #<cr>', { silent = true })
  --   end
  -- }
  -- use { "jakewvincent/mkdnflow.nvim",
  --   ft = {"markdown", "*.md", "vimwiki.markdown"},
  --   config = function() require("plug.mkdnflow") end,
  -- }
--   use {'m-demare/hlargs.nvim',
--     config = function() require("plug.hlargs") end,
--     requires = { 'nvim-treesitter/nvim-treesitter'
--   }
-- }
  use { 'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function() require("plug.mkdp") end,
    ft = { "*.md", "markdown", "pandoc", "vimwiki" },
  }
  use "skywind3000/asyncrun.vim"
  -- use { "kevinhwang91/nvim-hlslens", config = function()
		-- require('hlslens').setup()
  -- end}
      -- Testing
    -- use {
    --   "rcarriga/vim-ultest",
    --   config = "require('config.test').setup()",
    --   run = ":UpdateRemotePlugins",
    --   requires = { "vim-test/vim-test" },
    -- }
  -- use {"nvim-pack/nvim-spectre"}
  -- use 'junegunn/vim-easy-align'
  -- use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }


  -- use 'tpope/vim-fugitive' -- Git commands in nvim
  -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- use {'EdenEast/nightfox.nvim'}
    -- use { "sainnhe/everforest", opt = true }
end,
  -- use { 'aspeddro/pandoc.nvim', 
  --   config = function() 
  --     require("pandoc").setup(require("plug.pandoc").config)
  --   end
  -- }
  --
  -- NOTE: :: @EXPERIMENTAL :: COOL SHIT WHEN IM OLDER
--   use { "NTBBloodbath/rest.nvim"},
--   requires = { "nvim-lua/plenary.nvim" },
--   config = function()
--     require("rest-nvim").setup({
--       -- Open request results in a horizontal split
--       result_split_horizontal = false,
--       -- Keep the http file buffer above|left when split horizontal|vertical
--       result_split_in_place = false,
--       -- Skip SSL verification, useful for unknown certificates
--       skip_ssl_verification = false,
--       -- Highlight request on run
--       highlight = {
--         enabled = true,
--         timeout = 150,
--       },
--       result = {
--         -- toggle showing URL, HTTP info, headers at top the of result window
--         show_url = true,
--         show_http_info = true,
--         show_headers = true,
--       },
--       -- Jump to request line on run
--       jump_to_request = false,
--       env_file = '.env',
--       custom_dynamic_variables = {},
--       yank_dry_run = true,
--     })
--   end,
-- },
  init = require("plug.packer").init,
  config = require("plug.packer").config,
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
