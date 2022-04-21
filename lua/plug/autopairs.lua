require("nvim-autopairs").setup()
  local rule = require "nvim-autopairs.rule"
  local npairs = require "nvim-autopairs"
  local cond = require "nvim-autopairs.conds"
  local trules = require('nvim-autopairs.ts-rule')
--   local tconds = require('nvim-autopairs.ts-conds')


  npairs.add_rules({
    -- require('nvim-autopairs.rules.endwise-elixir'),
    -- require('nvim-autopairs.rules.endwise-ruby'),
--     require('nvim-autopairs.rules.endwise-lua'),
    -- @NOTE Makes there be a space added between lhs and rhs when inputting '='
    trules.endwise("then$", "end", "lua", "if_statement"),
  --   rule('=', '')
  --     :with_pair(cond.not_inside_quote())
  --     :with_pair(function(opts)
  --         local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
  --         if last_char:match('[%w%=%s]') then
  --             return true
  --         end
  --         return false
  --     end)
  --     :replace_endpair(function(opts)
  --         local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
  --         local next_char = opts.line:sub(opts.col, opts.col)
  --         next_char = next_char == ' ' and '' or ' '
  --         if prev_2char:match('%w$') then
  --             return '<bs> =' .. next_char
  --         end
  --         if prev_2char:match('%=$') then
  --             return next_char
  --         end
  --         if prev_2char:match('=') then
  --             return '<bs><bs>=' .. next_char
  --         end
  --         return ''
  --     end)
  --     :set_end_pair_length(0)
  --     :with_move(cond.none())
  --     :with_del(cond.none())
  })
-- apairs.disable_filetype = {
--   "TelescopePrompt",
--   "Telescope"
-- }  
-- apairs.ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
-- apairs.map_char = {
--   all = "(",
--   tex = "{"

-- }
