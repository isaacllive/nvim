local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return {}
end

local status_ok2, schemastore = pcall(require, "schemastore")
if not status_ok2 then
  return {}
end

return {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
}
