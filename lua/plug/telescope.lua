require('telescope').load_extension 'fzf'
require('telescope').load_extension 'zoxide'

-- Telescope
require('telescope').setup {
    defaults = {
    mappings = {
        i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        },
    },
    },
}

-- -- lvim.builtin.telescope.extensions = {
-- --   fzf = {}, file_browser = {}, project = {}
-- -- }
-- local tl=lvim.builtin.telescope
-- local tele = require("telescope")
-- local _, actions = pcall(require, "telescope.actions")
--
-- -- tl.defaults.prompt_prefix = " "
-- -- tl.defaults.path_display.shorten = nil
-- tl.pickers = {
--   find_files = { find_command = { "fd", "--type=file", "--hidden", "--exclude", ".git" } },
-- }
-- tl.extensions = {
--   project = {
--     enable = true,
--   },
--   file_browser = { 
--     theme="ivy",
--     mappings= {
--       ["i"] = {
--
--       },
--       ["n"] = {
--       }
--     }
--   },
--   fzf = { },
--
-- }
-- lvim.builtin.telescope.defaultsinitial_mode = "insert"
-- lvim.builtin.telescope.defaults.layout_config.horizontal.mirror = false
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
-- lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
-- lvim.builtin.telescope.defaults.layout_config.vertical.mirror = false
-- lvim.builtin.telescope.defaults.layout_config.width = 0.75
-- lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
--
-- -- tl.defaults = {
-- --   -- preview="dropdown",
-- --   -- initial_mode = "insert",
-- --   -- horizontal = {
-- --   --   mirror = false
-- --   -- },
-- --   color_devicons=true,
-- --   multi_icon=true,
-- --   initial_mode = "insert",
-- --   layout_config = {
-- --       height = 0.35,
-- --       width = 1.00,
-- --     horizontal = {
-- --       mirror = false
-- --     },
-- --     preview_cutoff = 120,
-- --     prompt_position = "bottom",
-- --     vertical = {
-- --       mirror = false
-- --     },
-- --   },
-- --   preview_cutoff = 120,
-- --   border = true,
-- --   layout_strategy = "bottom_pane",
-- --   -- path_display = { "shorten" },
-- --   sorting_strategy = "ascending",
-- -- }
--
-- tl.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
