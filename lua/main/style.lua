
-----------------------------------------------------------------------------
-- Theme settings
-----------------------------------------------------------------------------

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

onedark.setup({
  -- Main options --
  style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true, -- Show/hide background
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

-- local ok, material = pcall(require, "material")
-- if not ok then
--   return
-- end

-- material.setup({
--
--     contrast = {
--         terminal = false, -- Enable contrast for the built-in terminal
--         sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--         floating_windows = false, -- Enable contrast for floating windows
--         cursor_line = false, -- Enable darker background for the cursor line
--         non_current_windows = false, -- Enable contrasted background for non-current windows
--         filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
--     },
--
--     styles = { -- Give comments style such as bold, italic, underline etc.
--         comments = { --[[ italic = true ]] },
--         strings = { --[[ bold = true ]] },
--         keywords = { --[[ underline = true ]] },
--         functions = { --[[ bold = true, undercurl = true ]] },
--         variables = {},
--         operators = {},
--         types = {},
--     },
--
--     plugins = { -- Uncomment the plugins that you use to highlight them
--         -- Available plugins:
--         -- "dap",
--         -- "dashboard",
--          "gitsigns",
--         -- "hop",
--         -- "indent-blankline",
--         -- "lspsaga",
--         -- "mini",
--         -- "neogit",
--         -- "neorg",
--          "nvim-cmp",
--         -- "nvim-navic",
--         -- "nvim-tree",
--          "nvim-web-devicons",
--         -- "sneak",
--          "telescope",
--          "trouble",
--         -- "which-key",
--     },
--
--     disable = {
--         colored_cursor = false, -- Disable the colored cursor
--         borders = false, -- Disable borders between verticaly split windows
--         background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--         term_colors = false, -- Prevent the theme from setting terminal colors
--         eob_lines = false -- Hide the end-of-buffer lines
--     },
--
--     high_visibility = {
--         lighter = false, -- Enable higher contrast text for lighter style
--         darker = false -- Enable higher contrast text for darker style
--     },
--
--     lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
--
--     async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
--
--     custom_colors = nil, -- If you want to override the default colors, set this to a function
--
--     custom_highlights = {}, -- Overwrite highlights with your own
-- })

-----------------------------------------------------------------------------
-- General style settings
-----------------------------------------------------------------------------
-- :set termguicolors 
--
vim.cmd([[

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


