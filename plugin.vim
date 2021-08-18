
" Pluggin Manager
" ===============================================================
  :call plug#begin('~/.vim/plugged')
" ===============================================================
 
  " Apearance 
  Plug 'sainnhe/sonokai'
  Plug 'joshdick/onedark.vim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'psliwka/vim-smoothie'
  Plug 'ap/vim-css-color'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'mhinz/vim-startify', {'branch': 'center'}

  " Required Libraries 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'xolox/vim-misc'
  Plug 'RishabhRD/popfix'

  " Aditional Functionality
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'folke/lsp-trouble.nvim'
  Plug 'RishabhRD/nvim-lsputils'
  Plug 'jiangmiao/auto-pairs'      
  Plug 'alvan/vim-closetag'
  Plug 'L3MON4D3/LuaSnip' 
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'dhruvmanila/telescope-bookmarks.nvim'
  Plug 'xolox/vim-session'
  Plug 'AckslD/nvim-neoclip.lua'
  Plug 'vimwiki/vimwiki'

 " Plug 'bfredl/nvim-miniyank'
" ===============================================================
  :call plug#end()
" ===============================================================

" plugins configs
:source ~/.config/nvim/plugin_conf/startify.vim
:source ~/.config/nvim/plugin_conf/luasnip.vim
:source ~/.config/nvim/plugin_conf/session.vim
":source ~/.config/nvim/plugin_conf/miniyank.vim
:source ~/.config/nvim/plugin_conf/closetag.vim
"
" lua pluggin configs
:luafile ~/.config/nvim/lua/lsprc.lua
:luafile ~/.config/nvim/lua/comperc.lua
:luafile ~/.config/nvim/lua/lsputilsrc.lua
:luafile ~/.config/nvim/lua/lsptroublerc.lua
:luafile ~/.config/nvim/lua/gitsignsrc.lua
:luafile ~/.config/nvim/lua/telescoperc.lua
:luafile ~/.config/nvim/lua/lualinerc.lua
:luafile ~/.config/nvim/lua/neoclip.lua




