
" Pluggin Manager
" ===============================================================
  :call plug#begin('~/.vim/plugged')
" ===============================================================
  Plug 'sainnhe/sonokai'
  Plug 'psliwka/vim-smoothie'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'tpope/vim-surround'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'mhinz/vim-startify', {'branch': 'center'}
  Plug 'itchyny/lightline.vim'
  Plug 'ap/vim-css-color'
  Plug 'wincent/terminus'
  Plug 'vimwiki/vimwiki'
  Plug 'liuchengxu/vim-which-key'
 
  "Plug lsp_signature
" ===============================================================
  :call plug#end()
" ===============================================================

" plugins configs
:source ~/.config/nvim/plugin_conf/lightline.vim
:source ~/.config/nvim/plugin_conf/startify.vim

" lua pluggin configs
:lua require('lsprc')
:lua require('comperc')
:lua require('lsp_sign')
:lua require('gitsignsrc')

autocmd BufReadPost,FileReadPost lua require \"lsp_signature\".on_attach()




