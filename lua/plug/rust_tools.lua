local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

function au_enter(group, pattern, callback)
    aucmd("BufRead,BufEnter,BufWinEnter", {
      callback = callback,
      group = group,
      pattern = pattern,
  })
end

local ext_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local codelldb = ext_path .. 'adapter/codelldb'
local liblldb = ext_path .. 'lldb/lib/liblldb.so'
    server = {
        cmd = { vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer" },
        -- on_attach = require("lvim.lsp").common_on_attach,
        -- on_init = require("lvim.lsp").common_on_init,
    }

 require("rust-tools").setup({
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      show_variable_name = true,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 4,
			highlight = "Comment",
		},
		crate_graph = {
			backend = "x11",
			output = nil,
			full = true,
			enabled_graphviz_backends = {
			},
		},
		hover_actions = {
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},
			auto_focus = false,
		},
    runnables = {
      use_telescope = true,
    },
  },
  dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
    -- adapter = rdap.get_code_lldb_adapter(codelldb, liblldb)
  },
  server = {
    standalone = false,
    -- on_attach = require("lvim.lsp").common_on_attach,
    -- on_init = require("lvim.lsp").common_on_init,
    cmd = { vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer" },
    settings = {
      ["rust-analyzer"] = {
        semantic_highlighting = {
          strings = { enable = true },
        },
        lens = {
          run = { enable = true },
          debug = { enable = true },
          enable = true,
          methodReferences = { enable = true },
          forceCustomCommands = true,
          references = {
            enable = true,
            enumVariants = { enable = true },
            trait = { enable = true }
          }
        },
        imports = {
          group = { enable = true },
          merge = "glob",
          granularity = {
            group = "module",
            -- enforce
          }
        },
        debug = {
          openDebugPane = false,
        },
        cachePriming = {
          enable = true;
        },
        runnables = {
          -- command = 
        },
        assist = {
          importGroup = true,
          importPrefix = "plain",
          expressionFillDefault = true,

        },
        cargo = {
          autoReload = true,
          allFeatures = false,
          buildScripts = {
            enable = true
          }
        },
        procMacro = {
          enabled = false,
          ignored = { },
        },
        highlightRelated = {
          breakPoints = { enable = true },
          yieldPoints = { enable = true },
          exitPoints = { enable = true },
          references = { enable = true },
        },
        typing = {
          autoClosingAngleBrackets = { enable = true };
        },

        signatureInfo = {
          documentation = { enable = true },
          detailed = true
        },
        inlayHints = {
          renderColons = true,
          renderColonsInCallSignature = true,
          parameterHints = {
            enable = true
          },
          closingBraceHints = { enable = true },
          bindingModeHints = {
            enable = true,
          },
          lifetimeElisionHints = {
            enable = true,
          },
          typeHints = {
            hideClosureInitialization = true,
            hideNamedConstructor = true,
          },
          closureReturnTypeHints = true,
          reborrowHints = { enable = true },
          chainingHints = { enable = true },
        },
        hoverActions = {
          debug = true,
          implementations = true,
          run = true,
          enable = true,
        },
        checkOnSave = {
          target = true,
          enable = true
        },
        rustfmt = {
          -- overrideCommand = 
        },
        diagnostics = {
          disabled = false,
          enable = true;
          experimental = {enable = true},
          enableExperimental = true;
          -- remapPrefix = ""
        },
        experimental = {
          procAttrMacros = true,
        },
        hover = {
          links = { enable = true },
          linksInHover = { enable = true },
          documentation = { enable = true },
          actions = {
            enabled = true,
            run = { enable = true },
            references = { enable = true },
            implementations = { enable = true }
          }
        },
        workspace = {
          symbol = {
            search ={
              scope = "workspace",
              -- kind = 
            }
          }
        },
        joinLines = {
          unwrapTrivialBlock = true,
          removeTrailingComma = true,
          -- joinElseIf =
        },
        callInfo = {
          full = true,

        },
        completion = {
          addCallParenthesis = true,
          autoimport = { enable = true },
          callable = { snippets = true },
          autoself = {
            enable = true
          },
          postfix = {
            enable = true
          },
          privateEditable = {
            enable = true
          }
        },

      }
    }
  }
})



local rust_group = augroup('Rust', { clear = true })
local nmap = function(k, c, o) vim.keymap.set("n", k, c, o) end
local abbr = function(mode, abb, res)
  vim.cmd(mode .. "abbrev " .. abb .. " " .. res)
end

au_enter(rust_group, "*.rs", function()
  abbr("i", ":", "::")
  vim.keymap.set("n", ",rr", "<ESC>:TermExec cmd='cargo r'<CR>")
  vim.keymap.set("n", "<space>Rr", "<ESC>: cmd='cargo r'<CR>")
  nmap("<Space>Rf", "<CMD>RustFmt<CR>", { noremap = true })
  nmap("<Space>RR", "<CMD>RustRun<CR>", { noremap = true })
  nmap("<Space>Rr", "<CMD>RustRunnables<CR>", { noremap = true })
  nmap("<Space>Ra", "<CMD>RustCodeActions<CR>", { noremap = true })
  nmap("<Space>Rh", "<CMD>RustHoverActions<CR>", { noremap = true })
  nmap("<Space>Rd", "<CMD>RustDebuggables<CR>", { noremap = true })
  nmap("<Space>Rp", "<CMD>RustPlay<CR>", { noremap = true })
  nmap("<Space>Rc", "<CMD>RustOpenCargo<CR>", { noremap = true })
  nmap("<space>Rp", "<CMD>RustParentModule<CR>", {noremap = true})
  nmap("<space>Rp", "<CMD>RustParentModule<CR>", {noremap = true})
  nmap("<space>Rw", "<CMD>RustReloadWorkspace<CR>", {noremap = true})
  nmap("<space>Ri", "<CMD>RustToggleInlayHints<CR>", {noremap = true})
end)


