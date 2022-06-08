local null_ls = require("null-ls")
-- local cactions = null_ls.code_actions
-- local linters = require("null-ls.linters")
-- local services = require("null-ls.services")
-- local formatters = require("null-ls.formatters")
-- local diagnostics = require("null-ls.diagnostics")
-- local formatters = require("null-ls.builtins.formatting")
-- local null_ls.builtins.linting.= require("null-ls.builtins.diagnostics")
local casrc = {
  -- null_ls.builtins.code_actions.refactoring.with({
  --   filetypes: { "go", "javascript", "lua", "python", "typescript" },
  -- }),
}
-- local clsrc = {
--   null_Ls.builtins.completions.luasnip,
-- }
local src = {
  	null_ls.builtins.diagnostics.sqlfluff.with({
		extra_args = {"--dialect", "postgres"} -- change to your dialect
	}),
  null_ls.builtins.code_actions.eslint,
  null_ls.builtins.code_actions.shellcheck,
  null_ls.builtins.code_actions.xo,
	-- null_ls.builtins.linting.shellcheck,
	-- null_ls.builtins.linting.pylint,
	-- null_ls.builtins.linting.pylama,
	-- null_ls.builtins.linting.luacheck,
	-- null_ls.builtins.linting.mypy,
	-- null_ls.builtins.linting.protoc_gen_lint,
	-- null_ls.builtins.linting.protolint,
	-- null_ls.builtins.linting.golangci_lint,
	-- null_ls.builtins.linting.hadolint,
	-- null_ls.builtins.linting.djlint,
	-- null_ls.builtins.linting.eslint_d,
	-- null_ls.builtins.linting.fish,
	-- null_ls.builtins.linting.credo,
	-- null_ls.builtins.linting.curlylint,
	-- null_ls.builtins.linting.cppcheck,
	-- null_ls.builtins.linting.chxtex,
	-- null_ls.builtins.linting.actionlint,
	-- null_ls.builtins.linting.ansiblelint,
	-- null_ls.builtins.linting.checkmake,
	-- null_ls.builtins.linting.revive,
 --  null_ls.builtins.linting.yamllint,
 --  null_ls.builtins.linting.zsh,
}
local fsrc = {
  -- null_ls.builtins.formatting.prettier.with({
  --     filetypes = { "html", "json", "yaml", "toml" },
  -- },
  -- formatters.shellharden,
  -- -- formatters.sqlformat,,
  -- formatters.sqlfluff,
  -- formatters.cljstyle,
  -- formatters.eslint_d,
  -- formatters.black,
  -- formatters.clang_format,
  -- formatters.flake8,
  -- formatters.autopep8,
  -- formatters.autopep8,
  -- formatters.buf.with({
  --   filetypes = { "proto" }
  -- }),
  -- formatters.codespell,
  -- formatters.tidy,
  -- formatters.markdownlint,
  -- formatters.cmake_format.with({
  --   filetypes = { "cmake" },
  -- }),
  -- formatters.dart_format.with({
  --   filetypes = { "dart" },
  -- }),
  -- formatters.crystal_format.with({
  --   filetypes = {"crystal"},
  -- }),
  -- formatters.deno_fmt.with({
  --   filetypes = { "typescript" }
  -- }),
  -- formatters.nimpretty.with({
  --   filetypes = { "nim" }
  -- }),
  -- formatters.yapf.with({
  --   filetypes = {"yapf"}
  -- }),
  -- formatters.zigfmt.with({
  --   filetypes = {"zigfmt"}
  -- }),
  -- formatters.pg_format.with({
  --   filetypes = {"sql", "pgsql"}
  -- }),
  -- formatters.rustfmt.with({
  --   filetypes = {"rustfmt"}
  -- }),
  -- formatters.qmlformat.with({
  --   filetypes = {"qml"}
  -- }),
  -- formatters.prismafmt.with({
  --   filetypes = { "prisma" }
  -- }),
  -- formatters.rome,
    -- null_ls.builtins.diagnostics.write_good,
    -- null_ls.builtins.code_actions.gitsigns,
  -- formatters.taplo.with({
  --   filetypes = { "toml" }
  -- }),
  -- formatters.shfmt
}

null_ls.setup({ sources = src})
