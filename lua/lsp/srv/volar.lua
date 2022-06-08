local lspconf = require"lspconfig"
local lspcutil = require"lspconfig.util"
local lspconfigs = require"lspconfig.configs"

local function on_new_config(new_config, new_root_dir) 
  local function get_tsserver_path(root_dir)
    local projroot = lspcutil.find_node_modules_ancestor(root_dir)
    local tsexists = lspcutil.path.join(
      projroot,
      "node_modules",
      "typescript",
      "lib",
      "tsserverlibrary.js"
    )
    return projroot and tsexists or ''
  end
  if new_config.init_options then
    if new_config.init_options.typescript then
      if new_config.init_options.typescript.serverPath == "" then
        local tsp = get_tsserver_path(new_root_dir)
        new_config.new_config.typescript.serverPath = tsp
      end
    end
  end
end

local volar_cmd = {'vue-language-server', '--stdio'}
local volar_root_dir = lspconfig_util.root_pattern 'package.json'

-- lspconfigs.volar_api = {
--   default_config = {
--     filetypes = { "vue" },
--     --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
--     init_options = {
--       typescript = {
--         serverPath = ''
--       },
--        completion = {
--        },
--      }
--     ,
--   }
-- }
--
lspconf.volar.setup({
  -- cmd = { "vue-language-server", "--stdio" },
  -- root_dir = volar_root_dir,
  -- on_new_config = on_new_config,
  -- fietypes = { "vue" },
  -- int_options = {
  --   documentFeatures = {
  --     documentColor = false,
  --     documentFormatting = {
  --       defaultPrintWidth = 100
  --     },
  --     documentSymbol = true,
  --     foldingRange = true,
  --     linkedEditingRange = true,
  --     selectionRange = true
  --   },
  --   languageFeatures = {
  --     callHierarchy = true,
  --     codeAction = true,
  --     codeLens = true,
  --     completion = {
  --       defaultAttrNameCase = "kebabCase",
  --       defaultTagNameCase = "both",
  --       -- getDocumentNameCasesRequest = false,
  --       -- getDocumentSelectionRequest = false,
  --     },
  --     definition = true,
  --     diagnostics = true,
  --     documentHighlight = true,
  --     documentLink = true,
  --     hover = true,
  --     implementation = true,
  --     references = true,
  --     rename = true,
  --     renameFileRefactoring = true,
  --     schemaRequestService = true,
  --     semanticTokens = false,
  --     signatureHelp = true,
  --     typeDefinition = true
  --   },
  --   typescript = {
  --     serverPath = ""
  --   }
  -- }
})

-- local takeover = {
--   filetypes = {
--     'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'
--   },
  -- init_options = {
    -- typescript = {
      -- server_path = "~/.local/share/nvim/lsp_servers/tsserver/node_modules/typescript-language-server/lib/hover.d.ts"
    -- }

  -- },
--   capabilities = {
--
--   },
--
--
--
-- }
--
-- local vueonly = {
--   filetypes = {
--     "vue",
--   },
--
-- }
-- require"lspconfig".volar.setup{
--   filetypes = {
--     
--   },
--
-- }
