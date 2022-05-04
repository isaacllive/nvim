" Set up commands 

":set syntax enable                      " Enables syntax highlighing
:set number                              " Line numbers
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
:set laststatus=2                        " Always display the status line
:set cursorline                          " Enable highlighting of the current line
":set background=dark                    " tell vim what the background color looks like
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
:set foldmethod=marker                   " De   
:set foldmarker=~f,f~
:set foldlevel=0                         " Determine fold level
:filetype plugin on                      " File type recognition for plugin files

" WSL yank support; allows yanks to show in windows clipboard...
let s:clip = '/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
      autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" Yanking in visual mode copies text to win clipboard
:vnoremap <y> *y

function! NeatFoldText() " ~f
  let line = '' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ''
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = ' ' 
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*1) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()
" f~ 


" Handles Termnial 
:au BufEnter if &buftype == 'terminal' 
  \  | :exec 'normal! i'                       " Always enter Terminal in insert mode 
  \  | :set nonumber norelativenumber          " Removes side numbers when using terminal 
  \  | endif   

:au BufEnter  if &buftype != 'terminal' 
  \  | :set number                             " Add numbers back when leaving terminal 
  \  | endif  

:au TermOpen * startinsert 
  \  | :set nonumber norelativenumber         " Insert mode when swiching to terminal 
  \  | :let g:terminal_scrollback_buffer_size = 1
  \  | :noremap <buffer> <C-c> i<C-c>         " Allows for C-c escaping process in terminal


