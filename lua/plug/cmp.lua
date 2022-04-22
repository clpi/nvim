local cmp = require 'cmp'
local luasnip = require 'luasnip'
local util = require "util"

-- local kindicons_fmt = require("lspkind").cmp.format({
--   mode = 'symbol', -- show only symbol annotations
--   preset = "codicons",
--   maxwidth = 50,
--   before = function (entry, vim_item)
--     return vim_item
--   end,
-- })

local miscicons_fmt = function(entry, vim_item)
  local typeicon = util.kind_icons[vim_item.kind]
  local typetxt = string.sub(vim_item.kind, 0, 2)
  vim_item.kind = string.format('%s %s',typeicon, typetxt)
  -- vim_item.kind = typeicon
  vim_item.menu = util.src_icons[entry.source.name]
  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
  return vim_item
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = {'kind', 'abbr','menu'},
    format = miscicons_fmt,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-3),
    ['<C-b>'] = cmp.mapping.scroll_docs(-3),
    ['<C-f>'] = cmp.mapping.scroll_docs(3),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  }),
  completion = {
  },
  experimental = { ghost_text = false },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'crates' },
    { name = 'copilot' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = "vimwiki-tags" },
    { name = 'neorg' },
    { name = 'orgmode' },
    { name = 'nvim_lsp_document_symbol' },
    { name = "luasnip", group_index = 4, option = { use_show_condition = false }},
    { name = 'buffer' },
  },
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
    -- { name = "cmdline_history"}
  })
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "nvim_lsp_document_symbol" },
    -- { name = "cmdline_history"},
    { name = 'buffer' }
  }
})


cmp.setup.filetype({ 
  "*.md", 
  "markdown", 
  "vimwiki.markdown", 
  "vimwiki" }, 
{
  sources = {
    { name = "vimwiki-tags"},
    { name = "path"},
    { name = "luasnip"},
    { name = "buffer"},
    { name = 'copilot' },
  },
})


-- lcmp.formatting.source_names = {
--   buffer                   = " Bu",
--   calc                     = " Ca",
--   cmp_tabnine              = "  Tn",
--   emoji                    = "  Em",
--   luasnip                  = " Sn",
--   nvim_lsp                 = " Ls",
--   path                     = " Pa",
--   vsnip                    = " Vs",
--   crates                   = " Cr",
--   dadbod                   = " Db",
--   nvim_lua                 = " Lu",
--   orgmode                  = "ﯟ Or",
--   neorg                    = "ﯟ Ne",
--   treesitter               = "ﰠ Ts",
--   copilot                  = "ﲀ Co",
--   nvim_lsp_signature_help  = "פּ Sh",
--   nvim_lsp_document_symbol = "ﭨ Ds"
-- }
--
-- lcmp.experimental.ghost_text = false
--
-- --[[
-- lvim.builtin.cmp.formatting.source_names = {
--         buffer = " ",
--         path = " ",
--         cmdline = " ",
--         file = " ",
--         orgmode = " ",
--         nvim_lsp = " ",
--         luasnip = " ",
--         nvim_lua = " ",
--         latex_symbols = "ﭨ ",
-- 	      crates = " ",
-- 	      nvim_lsp_signature_help = "פּ ",
-- 	      nvim_lsp_document_symbol = "פּ ",
--         emoji = "ﯟ ",
--         calc = "",
--         treesitter = "פּ"
-- }
-- ]]
-- lvim.builtin.cmp.formatting.kind_icons = {
--   Text = " ",
--   Method = " ",
--   Function = " ",
--   Constructor = " ",
--   Field = "ﰠ" ,
--   Namespace = "ﲀ" ,
--   Variable = " ",
--   Class = " ",
--   Interface = " ",
--   Module = " ",
--   Property = " ",
--   Unit = " ",
--   Value = " ",
--   Enum = " ",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Object = " ",
--   Key = "",
--   Package = "",
--   Null = "ﰮ",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Array = " ",
--   Operator = "",
--   TypeParameter = "",
-- }
