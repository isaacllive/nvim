
local null_ls = require("null-ls")
local sources = {
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.refactoring,

  null_ls.builtins.completion.luasnip,
  null_ls.builtins.completion.spell,

  null_ls.builtins.diagnostics.codespell,
  --null_ls.builtins.diagnostics.tsc,
  null_ls.builtins.diagnostics.jsonlint,
  null_ls.builtins.diagnostics.luacheck,
  null_ls.builtins.diagnostics.markdownlint,
}

null_ls.setup({ sources = sources })
