local c1, lspconfig = pcall(require, "lspconfig")
if not c1 then
  error("CUSTOM: lspconfig plugin not found, required for LSP")
end

local c2, mason = pcall(require, "mason")
if not c2 then
  error("CUSTOM: Mason plugin not found, required for LSP")
end

local c3, masonLspConfig = pcall(require, "mason-lspconfig")
if not c3 then
  error("CUSTOM: Mason-lspconfig plugin not found, required for LSP")
end

local c4, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not c4 then
  error("CUSTOM: cmp_nvim_lsp plugin not found, required for LSP")
end

local servers = CustomRequire('ls_configs')
if (not servers) then
  error("CUSTOM: error language server files missing")
end

local server_list = {}
for serverName, _ in pairs(servers) do
  table.insert(server_list, serverName)
end

mason.setup()
masonLspConfig.setup({
  automatic_installation = true,
  ensure_installed = server_list,
})

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  cmp_lsp.default_capabilities()
)

local opts = lsp_defaults
for serverName, setup in pairs(servers) do
  if setup then
    local currOpts = setup()
    opts = vim.tbl_deep_extend("force", currOpts, opts)
  end

  lspconfig[serverName].setup(opts)
end

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

local icons = CustomRequire("icons")
if icons then
  Sign({ name = "DiagnosticSignError", text = icons.diagnostics.Error })
  Sign({ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning })
  Sign({ name = "DiagnosticSignHint", text = icons.diagnostics.Hint })
  Sign({ name = "DiagnosticSignInfo", text = icons.diagnostics.Information })
end
