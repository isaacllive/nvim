vim.cmd([[

  " Set up commands 
  ":set syntax enable                      " Enables syntax highlighing
  :set relativenumber                              " Line numbers
  :set mouse=a                             " Enable your mouse
  :set hidden                              " Required to keep multiple buffers open multiple buffers
  :set nowrap                              " Display long lines as just one line
  :set encoding=utf-8                      " The encoding displayed
  :set pumheight=10                        " Makes popup menu smaller
  :set fileencoding=utf-8                  " The encoding written to file
  :set ruler              			           " Show the cursor position all the time
  :set cmdheight=1                         " More space for displaying messages
  :set iskeyword+=-                      	 " treat dash separated words as a word text object"
  :set splitbelow                          " Horizontal splits will automatically be below
  :set splitright                          " Vertical splits will automatically be to the right
  :set t_Co=256                            " Support 256 colors
  :set conceallevel=0                      " So that I can see `` in markdown files
  :set tabstop=2                           " Insert 2 spaces for a tab
  :set shiftwidth=2                        " Change the number of space characters inserted for indentation
  :set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
  :set expandtab                           " Converts tabs to spaces
  :set smartindent                         " Makes indenting smart
  :set autoindent                          " Good auto indent
  :set laststatus=3                        " Always display the status line
  :set cursorline                          " Enable highlighting of the current line
  ":set background=dark                    " tell vim what the background color looks like
  :set showtabline=2                       " Present Airblade Status Line 
  :set nobackup                            " This is recommended by coc
  :set nowritebackup                       " This is recommended by coc
  :set updatetime=300                      " Faster completion
  :set timeoutlen=500                      " By default timeoutlen is 1000 ms
  :set formatoptions-=cro                  " Stop newline continution of comments
  :set clipboard=unnamedplus               " Copy paste between vim and everything else
  :set completeopt=menu,menuone,noselect   " Suggestion macht longest
  :set showcmd                             " Show commands that you type 
  :set confirm                             " Confirm when exiting without save
  ":set lazyredraw                          " Speed up scrolling
  :set wmh=0
  :set noshowmode                          " Dont show mode covered by lighline
  :set shortmess+=c                        " Dont show 'pattern not found prompt 
  :set nocompatible
  :set foldmethod=marker                   " De   
  :set foldmarker=~f,f~
  :set foldlevel=0                         " Determine fold level
  :filetype plugin on                      " File type recognition for plugin files
  "":set spell                               " Set lsp spellchack for comments

  :command! Close bufdo bd | q!                               
  :command! ConfigFile e $MYVIMRC                             " Fast Main kConfig access
  :command! ConfigSSH e ~/.ssh/config                         " Fast SSH Config access
  :command! ConfigPlugins e ~/.config/nvim/lua/plugins.lua    " fast plugin config access
  :command! ConfigShell e $SHELL_RC                           " fast rc config access

]])

vim.o.ch = 0

vim.cmd('command! ConfigPlugins e ~/.config/nvim/lua/' .. PROFILE .. '/plugins.lua')
