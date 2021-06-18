" Set up commands 

:syntax enable                           " Enables syntax highlighing
:set hidden                              " Required to keep multiple buffers open multiple buffers
:set nowrap                              " Display long lines as just one line
:set encoding=utf-8                      " The encoding displayed
:set pumheight=10                        " Makes popup menu smaller
:set fileencoding=utf-8                  " The encoding written to file
:set ruler              			            " Show the cursor position all the time
:set cmdheight=1                         " More space for displaying messages
:set iskeyword+=-                      	" treat dash separated words as a word text object"
:set mouse=a                             " Enable your mouse
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
:set laststatus=2                        " Always display the status line
:set number                              " Line numbers
:set cursorline                          " Enable highlighting of the current line
:set background=dark                     " tell vim what the background color looks like
:set showtabline=2                       " Present Airblade Status Line 
:set nobackup                            " This is recommended by coc
:set nowritebackup                       " This is recommended by coc
:set updatetime=300                      " Faster completion
:set timeoutlen=500                      " By default timeoutlen is 1000 ms
:set formatoptions-=cro                  " Stop newline continution of comments
:set clipboard=unnamedplus               " Copy paste between vim and everything else
:set completeopt=menuone,noselect        " Suggestion macht longest
:set showcmd                             " Show commands that you type 
:set confirm                             " Confirm when exiting without save
:set lazyredraw                          " Speed up scrolling
:set wmh=0
:set noshowmode                          " Dont show mode covered by lighline
:set shortmess+=c                        " Dont show 'pattern not found prompt 
:set nocompatible
:filetype plugin on                      " File type recognition for plugin files
:set foldmethod=marker                   " De   
:set foldlevel=0                         " Determine fold level

" WSL yank support; allows yanks to show in windows clipboard...
let s:clip = '/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
      autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

