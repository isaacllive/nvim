
" Pluggin Manager
:call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'marko-cerovac/material.nvim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'ap/vim-css-color'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'wincent/terminus'
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'

:call plug#end()


" Load Lua Modules
lua require('lsprc')
lua require('comperc')

"Normal vim configuration

source ~/.config/nvim/style.vim
source ~/.config/nvim/remaps.vim
source ~/.config/nvim/settings.vim




