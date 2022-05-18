local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

function au_enter(group, pattern, callback)
    aucmd("BufRead,BufEnter,BufWinEnter", {
      callback = callback,
      group = group,
      pattern = pattern,
  })
end

local rtools = require("rust-tools")
local rdap = require("rust-tools.dap")
local ext_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local codelldb = ext_path .. 'adapter/codelldb'
local liblldb = ext_path .. 'lldb/lib/liblldb.so'

rtools.setup({
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
			-- backend = "x11",
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


