local M = {}

M.setup = function()

  require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.norg.dirman"] = { -- Manage your directories with Neorg
        config = {workspaces = {my_workspace = "~/neorg"}}
      },
      ["core.keybinds"] = { -- Configure core.keybinds
        config = {
          default_keybinds = true, -- Generate the default keybinds
          neorg_leader = "<Leader>o" -- This is the default if unspecified
        }
      },
      ["core.norg.completion"] = {config = {engine = "nvim-cmp"}},
      ["core.integrations.telescope"] = {} -- Enable the telescope module
    }
  }
  local neorg_callbacks = require("neorg.callbacks")

  neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
      n = { -- Bind keys in normal mode
        {"<C-s>", "core.integrations.telescope.find_linkable"}
      },

      i = { -- Bind in insert mode
        {"<C-l>", "core.integrations.telescope.insert_link"}
      }
    }, {silent = true, noremap = true})
  end)

end


-- M.setup = function()
--   M.get_parsers()
--   require("neorg").setup {
--     load = {
--       ["core.defaults"] = {},
--       ["core.keybinds"] = {
--         config = {
--           neorg_leader = ",",
--           default_keybinds = true,
--           hook = nil,
--           keybind_preset = "neorg",
--         },
--       },
--       ["core.ui"] = {
--         config = {
--
--         }
--       },
--       ["core.gtd.ui"] = {
--         config = {
--
--         },
--       },
--       ["core.gtd.queries"] = {
--         config = {
--
--         }
--       },
--       ["core.integrations.treeesitter"] = {
--         config = {
--
--         }
--       },
--       ["core.norg.journal"] = {
--         config = {
--           workspace = "home",
--           journal_folder = "journal",
--           strategy = "nested",
--         }
--       },
--       ["core.norg.qol.todo_items"] = {
--         config = {
--
--         }
--       },
--       ["core.integrations.telescope"] = {
--         config = {
--
--         }
--       },
--       ["core.integrations.nvim-cmp"] = {
--         config = {
--
--         }
--       },
--       ["core.norg.concealer"] = {
--         config = {
--           icon_preset = "basic",
--           dim_code_blocks = true,
--         },
--       },
--       ["core.norg.completion"] = {
--         config = {
--
--         },
--       },
--       ["core.norg.dirman"] = {
--         config = {
--           workspaces = {
--             work = "~/mk/org/work",
--             home = "~/mk/org/home",
--           }
--         }
--       }
--     }
--
--   }
-- end
--
return M
