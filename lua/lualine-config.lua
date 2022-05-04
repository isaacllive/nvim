
local function currBuff()
  return vim.api.nvim_exec([[ echo bufnr('%') ]], true)
end


local function codeAction()
  return  "" -- require'nvim-lightbulb'.get_status_text()
end

require'lualine'.setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = {'', ''},
      section_separators = {'', ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {{codeAction}, 'encoding','filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {'fzf'}
}

