
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("Lua: warning LSP features disabled, [lspconfig] module not found");
  return
end


require(PROFILE .. ".lsp.lsp-signature")
require(PROFILE .. ".lsp.lsp-installer")
require(PROFILE .. ".lsp.handlers").setup()
require(PROFILE .. ".lsp.null-ls")


