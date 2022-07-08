local null_ls = require("null-ls")

local function isExecutable(params)
  vim.api.nvim_echo(params)
  return vim.fn.executable(params)
end

local sources = {
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.refactoring,
  null_ls.builtins.completion.luasnip,
  null_ls.builtins.completion.spell,
  null_ls.builtins.diagnostics.codespell.with({
    runtime_condition = function(params)
      vim.api.nvim_echo(params)
      return true
    end
  }),
  null_ls.builtins.diagnostics.jsonlint.with({
    runtime_condition = function(params)
      return true
    end
  }),
  null_ls.builtins.diagnostics.luacheck.with({
    runtime_condition = function(params)
      return true
    end
  }),
  null_ls.builtins.diagnostics.markdownlint.with({
    runtime_condition = function(params)
      return true
    end
  }),
}

null_ls.setup({ sources = sources })
