local null_ls = require("null-ls")
local help = require("null-ls.helpers")
local cmd_resolve = require("null-ls.helpers.command_resolver")
local ca = null_ls.builtins.code_actions
-- local cm = null_ls.builtins.completions
local di = null_ls.builtins.diagnostics
local fm = null_ls.builtins.formatting

local sources = {
  -- ca.shellcheck,
  ca.xo,
  -- cm.luasnip,
  di.ansiblelint,
  di.buf,
  di.actionlint,
  di.cppcheck,
  -- di.codespell,
  -- di.curlylint,
  -- di.eslint_d,
  di.fish,
  -- di.flake8,
  -- di.gccdiag,
  -- di.hadolint,
  -- di.jsonlint,
  -- di.luacheck,
  di.protoc_gen_lint,
  -- di.pylama,
  -- di.pylint,
  -- di.pyproject_flake8,
  di.qmllint,
  -- di.selene,
  -- di.semgrep,
  di.shellcheck,
  di.sqlfluff.with {
    extra_args = { "--dialect", "postgres" }
  },
  -- fm.sqlfluff.with {
  --   extra_args = { "--dialect", "postgres" }
  -- },
  -- di.standardjs,
  di.staticcheck,
  -- di.teal,
  di.tidy,
  -- di.trail_space,
  di.tsc,
  di.xo,
  di.yamllint,
  di.zsh,
    -- di.vulture,
    -- di.vint,
   -- di.stylellint,
   -- di.stylint,
  --
  --
        -- fm.asmfmt,
  -- fm.autopep8,
  -- fm.black,
  -- fm.blue,
        -- fm.buf,
        -- fm.buildifier,
        -- fm.cljstyle,
  -- fm.cmake_format,
  -- fm.crystal_format,
        -- fm.dart_format,
  -- fm.deno_format,
        -- fm.elm_format,
        -- fm.eslint_d,
        -- fm.fish_indent,
  -- fm.fixjson,
  -- fm.fnlfmt,
        -- fm.gofmt,
  -- fm.gofumpt,
  -- fm.goimports,
  -- fm.golines,
  -- fm.isort,
        -- fm.joker,  -- clj
        -- fm.jq,
  -- fm.json_tool,
        -- fm.lua_format,
  -- fm.mix,   -- elixir
        -- fm.nimpretty,
  -- fm.pg_format,
        -- fm.prettier,
  -- fm.prismaFmt,
        -- fm.protolint,
  fm.qmlformat,
        -- fm.zigfmt,
  -- fm.zprint,
  -- fm.uncrustify,
  fm.trim_whitespace,
  -- fm.terraform_fmt,
  -- fm.terrafmt,
  -- fm.standardjs,
        -- fm.tidy,
  -- fm.sql_formatter,
  -- fm.sqlformat,
  -- fm.swiftformat,
        -- fm.stylua.with({ condition = function(utils)
          -- return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
          -- end,}),
        -- -- fm.stylelint,
  -- fm.yapf,
        -- fm.shfmt,
        -- fm.shellharden,
  -- fm.scalafmt,
        -- fm.rustywind,
        -- fm.rustfmt.with({ condition = function(utils)
          -- return utils.root_has_file({ "rustfmt.toml", ".rustfmt.toml" })
        -- end,}),
        -- fm.rome,
        -- fm.rescript,
  -- fm.raco,

  -- null_ls.builtins.code_actions.refactoring.with({
  --   filetypes: { "go", "javascript", "lua", "python", "typescript" },
  -- }),
}
-- local clsrc = {
--   null_Ls.builtins.completions.luasnip,
-- }
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
null_ls.setup({
  sources = sources,
  -- updated_in_insert = false,
  -- on_exit = nil,
  -- on_init = nil,
  -- on_attach = nil,
  -- log = {
  --   enable = true,
  --   level = "warn",
  --   use_console = "async"
  -- },
  -- fallback_severity = vim.diagnostic.severity.ERROR,
  -- cmd = { "nvim" },
  -- debug = false,
  default_timeout = 5000,
  debounce = 150,
  diagnostics_format = "#{m} [#{s}]",
})
