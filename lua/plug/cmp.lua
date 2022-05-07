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
local confirm = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Replace,
  select = false,
}

local next = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end
local prev = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end
local miscicons_fmt = function(entry, vim_item)
  local typeicon = util.kind_icons[vim_item.kind]
  local typetxt = string.sub(vim_item.kind, 0, 3)
  vim_item.kind = string.format('%s %s',typeicon, typetxt)
  -- vim_item.kind = typeicon
  -- local srcicon = util.src_icons[entry.source.name]
  -- local srctxt = string.sub(entry.kind.name, 0, 2)
  -- vim_item.menu = string.format('%s %s', srcicon, srctxt)
  vim_item.menu = util.source_names[entry.source.name]
  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
  return vim_item
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- completion = {
  --   autocomplete = true,
  -- },
  -- matching = {
  --   disallow_fuzzy_matching = false,
  --   disallow_partial_matching = false,
  --   disalow_prefix_matching = false,
  -- },
  -- completion = {
  -- },
  -- sorting = {
  --   comparators = {
  --     cmp.config.compare.offset,
  --     cmp.config.compare.exact,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.score,
  --     cmp.config.compare.recently_used,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   }
  -- },
  matching = {
    disallow_fuzzy_matching = false,
    disallow_partial_matching = false,
    disallow_prefix_unmatching = true,
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
    ['<CR>'] = confirm,
    ['<TAB>'] = cmp.mapping(next, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(prev, { 'i', 's'}),
    ['<C-j>'] = cmp.mapping(next, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(prev, { 'i', 's'})
    -- ['<C-c>'] = cmp.mapping.close(),
    -- ['<C-p>'] = cmp.mapping.complete_common_string(),
  }),
  experimental = { ghost_text = false },
  enabled = true,
  preselect = cmp.PreselectMode.None,
  sources = {
    { name = 'nvim_lsp', group_index = 1 },
    { name = 'nvim_lsp_signature_help',group_index=2},
    { name = 'nvim_lua' , group_index=2},
    { name = 'crates', group_index=2 },
    { name = 'path', group_index=3 },
    { name = 'copilot', group_index=4 },
    { name = 'neorg', group_index = 5 },
    { name = 'orgmode', group_index = 5 },
    { name = "luasnip", group_index = 6, option = { use_show_condition = false }},
    { name = 'nvim_lsp_document_symbol', group_index = 7 },
    { name = 'buffer', group_index = 7 },
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
    {
      name = "vimwiki_tags",
      trigger_characters = {":", "@", "#"},
      group_index=1
    },
    { name = "path"},
    { name = "luasnip"},
    { name = "buffer"},
    { name = 'copilot' },
    { name = 'nvim_lsp_document_symbol',group_index=2},
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
