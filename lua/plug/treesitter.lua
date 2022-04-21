require('nvim-treesitter.configs').setup {
  autotag = { enable = true },
  ensure_installed = {
  "rust", "c", "lua", "cpp", "python", "zig",
  "yaml", "json", "jsonc", "javascript", "typescript",
  "tsx", "markdown", "comment", "html",
  "dockerfile", "clojure", "commonlisp", "go",
  "bash", "fish", "ruby", "dart", "query", "http",
  "dot", "hcl", "vim", "toml", "css", "nix", "elm",
  "rst", "norg", "hack", "llvm", "scss", "help",
  "elvish", "rego", "vala", "rasi", "make", "glsl",
  "java", "ruby", "scala", "slint", "hjson", "julia",
  "gleam", "cmake", "latex", "jsdoc", "regex", "prisma",
  "bibtex", "gomod", "ninja", "json5", "ocaml", "svelte",
  "elixir", "sparql", "kotlin", "fennel", "gowork", "scheme",
  "ledger", "fusion", "lalrpop", "glimmer", "todotxt", "ql",
  "haskell", "graphql", "solidity", "supercollider", "r",
  "vue"
  },
  matchup = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = 'gnn',
    node_incremental = 'grn',
    scope_incremental = 'grc',
    node_decremental = 'grm',
  },
},
indent = {
  enable = true,
},
textobjects = {
  select = {
    enable = true,
    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ['af'] = '@function.outer',
      ['if'] = '@function.inner',
      ['ac'] = '@class.outer',
      ['ic'] = '@class.inner',
    },
  },
  lsp_interop = {
    enable = true
  },
  swap = { enable = true },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      [']m'] = '@function.outer',
      [']]'] = '@class.outer',
    },
    goto_next_end = {
      [']M'] = '@function.outer',
      [']['] = '@class.outer',
    },
    goto_previous_start = {
      ['[m'] = '@function.outer',
      ['[['] = '@class.outer',
    },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}
-- local ts = lvim.builtin.treesitter
--
-- ts.ensure_installed = {
--   "rust", "c", "python", "zig", "cpp",
--   "haskell", "javascript", "typescript",
--   "go", "lua", "bash", "yaml", "json",
--   "ruby", "make", "toml", "json5", "latex", "cmake",
--   "svelte", "dockerfile",
--   "html", "css", "jsonc", "prisma", "bibtex",
--   "swift", "dart", "norg",
--   "comment", "fish", "tsx", "vim",
--   "julia", "http", "clojure", "scala",
--   "kotlin", "graphql", "lalrpop",
--   -- "comment", "fish", "tsx", "vim", "d", "r",
--   --
--
--   -- -- "nim",
--   -- "swift", "dart"
-- }
-- ts.ignore_install = { "haskell" }
--
-- ts.context_commentstring.enable = true
--
-- ts.incremental_selection.enable = true
--
-- ts.playground.enable = true
-- ts.playground.persist_queries = true
-- ts.playground.updatetime = 20
--
-- ts.rainbow.enable = true
-- ts.rainbow.extended_mode = true
-- ts.rainbow.max_file_lines = 1200
--
-- ts.autotag.enable = true
-- ts.highlight.enable = true
-- ts.indent.enable = true
-- ts.playground.enable = true
-- ts.context_commentstring.config = {
--   css = "/* %s */",
--   html = "<!-- %s -->",
--   json = "",
--   scss = "/* %s */",
--   svelte = "<!-- %s -->",
--   typescript = "// %s",
--   vue = "<!-- %s -->"
-- }
-- ts.matchup.enable = true
-- ts.playground.enable = true
-- ts.rainbow.enable = true
-- ts.textsubjects.enable = true
-- ts.textsubjects.keymaps = {
--   ["<space>|"] = "textsubjects-smart",
--   [",|"] = "textsubjects-big",
-- }
-- ts.textobjects.select.enable = true
-- ts.textobjects.swap.enable = true
--
-- ts.textsubjects.enable = true
-- ts.textsubjects.keymaps = {
--   [",tS"] = "textsubjects-big",
--   [",ts"] = "textsubjects-smart"
-- }
-- require("nvim-treesitter.configs").setup {
--   sync_install = false,
--   nvimGPS = {
--     enable = true
--   },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = "gnn",
--       node_decremental = "grm",
--       node_incremental = "grn",
--       scope_incremental = "grc"
--     }
--   }
-- }
-- --   ignore_install = { "haskell" },
-- --   sync_install = true,
-- --   update_strategy = "lockfile",
-- --     autopairs = { enable = true },
-- --     textobjects = {
-- --       select = { enable = true },
-- --       swap = { enable = true },
-- --     },
-- --     textsubjects = {
-- --       enable = true,
-- --       keymaps = {
-- --       }
-- --     },
-- --     autotag = {
-- --       disable = {},
-- --       enable = true,
-- --       loaded = true,
-- --     },
-- --     context_commentstring = {
-- --       config = {
-- --       },
-- --       disable = {},
-- --       enable = true,
-- --       loaded = true,
-- --     },
-- --     indent = {
-- --       enable = true,
-- --       disable = { "yaml" },
-- --       loaded = true,
-- --     },
-- --     rainbow = {
-- --       enable = true,
-- --       extended_mode = true,
-- --     },
-- --     -- nvimGPS = {
-- --     --   enable = true,
-- --     --   module_path = "nvim-gps.internal"
-- --     -- },
-- --     highlight = {
-- --       additional_vim_regex_highlighting = true,
-- --       custom_captures = {},
-- --       disable = { "latex" },
-- --       enable = true,
-- --       enabled = true,
-- --       loaded = true,
-- --     },
-- --     incremental_selection = {
-- --       disable = {},
-- --       enable = true,
-- --       keymaps = {
-- --       },
-- --     }
--
--
-- -- }
--
-- -- --   sync_install = false,
-- -- --   highlight = {
-- -- --     enable = true,
-- -- --     additional_vim_regex_highlighting = false,
-- -- --   },
-- -- --   modules = {
--
-- -- --   }
-- -- -- }
