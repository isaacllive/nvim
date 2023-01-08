
-----------------------------------------------------------------------------
-- Theme settings
-----------------------------------------------------------------------------

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

onedark.setup({
  -- Main options --
  style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false, -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  -- toggle theme style ---
  toggle_style_key = '<leader>ts', -- Default keybinding to toggle
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
})

onedark.load()

-----------------------------------------------------------------------------
-- General style settings
-----------------------------------------------------------------------------
--
vim.cmd([[

  :set termguicolors
  :set laststatus=3

  :hi Pmenu blend=0
  :hi WinSeparator guibg=None

  " Netrw Modifications 
  let g:netrw_keepdir = 0
  let g:netrw_banner = 0
  let g:netrw_browse_split = 0
  let g:netrw_altv = 3
  let g:netrw_winsize = 20
  let g:netrw_liststyle = 3

]])


