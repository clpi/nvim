local M = {}

M.preinit = function()
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  -- local plug = require "plug"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  end
  vim.cmd [[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]

  local status_ok, packer = pcall(require, "packer")
  if not status_ok then return end

  local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

  return packer
end

M.init = function()
  local packer = M.preinit()
  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }
end

-- M.setup = function(packer)
--   packer.init {
--     ensure_dependencies   = true, 
--     snapshot = nil,
--     snapshot_path = join_paths(stdpath 'cache', 'packer.nvim'),
--     package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
--     compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
--     plugin_package = 'packer', -- The default package for plugins
--     max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
--     auto_clean = true, -- During sync(), remove unused plugins
--     compile_on_sync = true, -- During sync(), run packer.compile()
--     disable_commands = false, -- Disable creating commands
--     opt_default = false, -- Default to using opt (as opposed to start) plugins
--     transitive_opt = true, -- Make dependencies of opt plugins also opt by default
--     transitive_disable = true, -- Automatically disable dependencies of disabled plugins
--     auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
--     git = {
--       cmd = 'git', -- The base command for git operations
--       subcommands = { -- Format strings for git subcommands
--         update         = 'pull --ff-only --progress --rebase=false',
--         install        = 'clone --depth %i --no-single-branch --progress',
--         fetch          = 'fetch --depth 999999 --progress',
--         checkout       = 'checkout %s --',
--         update_branch  = 'merge --ff-only @{u}',
--         current_branch = 'branch --show-current',
--         diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
--         diff_fmt       = '%%h %%s (%%cr)',
--         get_rev        = 'rev-parse --short HEAD',
--         get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
--         submodules     = 'submodule update --init --recursive --progress'
--       },
--       depth = 1, -- Git clone depth
--       clone_timeout = 60,
--       default_url_format = 'https://github.com/%s'
--     },
--     display = {
--       non_interactive = false,
--       open_fn  = nil,
--       open_cmd = '65vnew \\[packer\\]',
--       working_sym = '⟳',
--       error_sym = '✗',
--       done_sym = '✓',
--       removed_sym = '-',
--       moved_sym = '→',
--       header_sym = '━',
--       show_all_info = true,
--       prompt_border = 'double', -- 
--       keybindings = {
--         quit = 'q',
--         toggle_info = '<CR>',
--         diff = 'd',
--         prompt_revert = 'r',
--       }
--     },
--     luarocks = {
--       python_cmd = 'python'
--     },
--     log = { level = 'warn' },
--     profile = {
--       enable = true,
--       threshold = 1,
--     },
--     autoremove = true,
--   }
-- end
--
-- return M
return M
