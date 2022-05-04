" Swhich to Packer

" Pluggin Manager
" ===============================================================
  :call plug#begin('~/.vim/plugged')
" ===============================================================
 
  " Apearance 
  Plug 'sainnhe/sonokai'
  Plug 'navarasu/onedark.nvim'
  Plug 'sonph/onehalf', { 'rtp' : 'vim'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ap/vim-css-color'
  Plug 'hoob3rt/lualine.nvim'
  " Plug 'mhinz/vim-startify', {'branch': 'center'}
  Plug 'glepnir/dashboard-nvim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'rcarriga/nvim-notify'
  "Plug 'romgrk/barbar.nvim'

  " Required Libraries 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'xolox/vim-misc'
  Plug 'RishabhRD/popfix'

  " Aditional General Functionality
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'neovim/nvim-lspconfig'
  "Plug 'kabouzeid/nvim-lspinstall"everforest'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'hrsh7th/nvim-compe'
  Plug 'folke/lsp-trouble.nvim'
  Plug 'RishabhRD/nvim-lsputils'
  Plug 'kosayoda/nvim-lightbulb'
  Plug 'onsails/lspkind-nvim'
  Plug 'jubnzv/virtual-types.nvim'
  Plug 'jiangmiao/auto-pairs'      
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'dhruvmanila/telescope-bookmarks.nvim'
  Plug 'xolox/vim-session'
  Plug 'vimwiki/vimwiki'

""Additional Specific functionality
" ===============================================================
  :call plug#end()
" ===============================================================

" plugins configs
" :source ~/.config/nvim/plugin_conf/startify.vim
:source ~/.config/nvim/plugin_conf/dashboard.vim
:source ~/.config/nvim/plugin_conf/session.vim
":source ~/.config/nvim/plugin_conf/luasnip.vim

" lua pluggin config
:luafile ~/.config/nvim/lua/lsp.lua
:luafile ~/.config/nvim/lua/treesitter-config.lua
:luafile ~/.config/nvim/lua/lsputils-config.lua
:luafile ~/.config/nvim/lua/compe-config.lua
:luafile ~/.config/nvim/lua/lsptrouble-config.lua
:luafile ~/.config/nvim/lua/gitsigns-config.lua
:luafile ~/.config/nvim/lua/telescope-config.lua
:luafile ~/.config/nvim/lua/lspkind-config.lua
:luafile ~/.config/nvim/lua/lualine-config.lua
:luafile ~/.config/nvim/lua/neoscroll-config.lua
:luafile ~/.config/nvim/lua/barbar-config.lua
:luafile ~/.config/nvim/lua/nvim-notify-config.lua

