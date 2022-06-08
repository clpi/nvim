local M = {}

M.setup = function()
  M.get_parsers()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.keybinds"] = {
        config = {
          neorg_leader = ",",
          default_keybinds = true,
          hook = nil,
          keybind_preset = "neorg",
        },
      },
      ["core.ui"] = {
        config = {

        }
      },
      ["core.gtd.ui"] = {
        config = {

        },
      },
      ["core.gtd.queries"] = {
        config = {

        }
      },
      ["core.integrations.treeesitter"] = {
        config = {

        }
      },
      ["core.norg.journal"] = {
        config = {
          workspace = "home",
          journal_folder = "journal",
          strategy = "nested",
        }
      },
      ["core.norg.qol.todo_items"] = {
        config = {

        }
      },
      ["core.integrations.telescope"] = {
        config = {

        }
      },
      ["core.integrations.nvim-cmp"] = {
        config = {

        }
      },
      ["core.norg.concealer"] = {
        config = {
          icon_preset = "basic",
          dim_code_blocks = true,
        },
      },
      ["core.norg.completion"] = {
        config = {

        },
      },
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/mk/org/work",
            home = "~/mk/org/home",
          }
        }
      }
    }

  }
end

return M
