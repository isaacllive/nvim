local icons = CustomRequire "icons"

local function lspSummary()
  local summary = ''
  local errs = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  if errs > 0 then
    summary = summary .. icons.diagnostics.Error .. errs .. ' '
  end
  if warns > 0 then
    summary = summary .. icons.diagnostics.Warning .. warns
  end
  return summary
end

require 'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { '', '' },
    section_separators = { '', '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      { lspSummary }, 'filename',
    },
    lualine_x = { 'encoding', 'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'fzf' }
}
