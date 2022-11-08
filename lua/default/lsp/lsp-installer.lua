local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup()

local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local servers = {
  "jsonls",
  "volar",
  "sumneko_lua",
  "cssls",
  "cssmodules_ls",
  "html",
  "tsserver",
  "intelephense",
  "pyright",
  "rust_analyzer",
  "clangd",
  "yamlls",
  "bashls",
}

local settings = {
  ensure_installed = servers,
  automatic_installation = true,
}

lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do

  opts = {
    on_attach = require(PROFILE .. ".lsp.handlers").on_attach,
    capabilities = require(PROFILE .. ".lsp.handlers").capabilities,
  }

  if server == "volar" then
    -- require 'lspconfig'.volar.setup {}
    opts = vim.tbl_deep_extend("force", {}, opts)
  end

  if server == "jsonls" then
    local jsonls_opts = require(PROFILE .. ".lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require(PROFILE .. ".lsp.settings.yamlls")
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require(PROFILE .. ".lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require(PROFILE .. ".lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "html" then
    local html_opts = require(PROFILE .. ".lsp.settings.html")
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  if server == "rust_analyzer" then
    local rust_opts = require(PROFILE .. ".lsp.settings.rust")

    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
      return
    end
    rust_tools.setup(rust_opts)
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
