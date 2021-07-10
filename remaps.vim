

" Remaping Leader
:let mapleader = " "

" Insert Mode ------------------------------------------------------
:imap jj <Esc>

"Format File
:nnoremap ff <cmd>lua vim.lsp.buf.formatting()<CR>

"Use <Tab> and <S-Tab> to navigate the completion list:
:inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Normal Mode -------------------------------------------------------
:nnoremap <C-p> :Files<CR>

" Tab-Bufferc Movement
:noremap <C-t> :tabnew<CR>
:noremap <C-h> :tabp<CR>
:noremap <C-l> :tabn<CR>

" Split Movement
:noremap <A-j> <C-W>j<C-W><CR>
:noremap <A-k> <C-W>k<C-W><CR>
:noremap <A-h> <C-W>h<C-W><CR>
:noremap <A-l> <C-W>l<C-W><CR>
:nmap <C-w> <C-o><C-w>
:nmap vv <C-v>



" Terminal Mode ------------------------------------------------------
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-j> <C-\><C-n><C-W>j<C-W>
:tnoremap <A-k> <C-\><C-n><C-W>k<C-W>
:tnoremap <A-h> <C-\><C-n><C-W>h<C-W>
:tnoremap <A-l> <C-\><C-n><C-W>l<C-W>
:tnoremap <C-t> <C-\><C-n>:tabnew<CR>
:tnoremap <C-h> <C-\><C-n>:tabp<CR>
:tnoremap <C-l> <C-\><C-n>:tabn<CR>
:tnoremap <C-v> <C-\><C-n><C-v>

" Automatic Commands 

" Handles Termnial 
:au BufEnter if &buftype == 'terminal' 
  \  | exec 'normal! i'                       " Always enter Terminal in insert mode 
  \  | set nonumber norelativenumber          " Removes side numbers when using terminal 
  \  | endif   

:au BufEnter  if &buftype != 'terminal' 
  \  | set number                             " Add numbers back when leaving terminal 
  \  | endif  

:au TermOpen * startinsert 
  \  | :set nonumber norelativenumber         " Insert mode when swiching to terminal 
  \  | :noremap <buffer> <C-c> i<C-c>         " Allows for C-c escaping process in terminal

" Custom commands
:command! Config e $MYVIMRC                   " Fast Config access


" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"  \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif
"
"" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror


"  Floatterm key bindings
" :nnoremap fft :FloatermNew --height=0.9 --width=0.9 --wintype=float --name=TERMINAL <CR> <Bs><Bs><Bs>    
" :nnoremap ffg :FloatermNew --height=0.9 --width=0.9 --wintype=float lazygit  <CR><Bs><Bs><Bs>
" :nnoremap ffd :FloatermNew --height=0.9 --width=0.9 --wintype=float lazydocker  <CR><Bs><Bs><Bs>
" :nnoremap ffp :FloatermPrev<CR><Bs><Bs><Bs>  
" :nnoremap ffn :FloatermNext<CR><Bs><Bs><Bs>  
" :nnoremap fff :FloatermToggle --height=0.9 --width=0.9 --wintype=float<CR><Bs><Bs><Bs> 
" :nnoremap ff1 :FloatermFirst<CR><Bs><Bs><Bs>  
" :nnoremap ff9 :FloatermLast<CR><Bs><Bs><Bs> 
" :nnoremap ffh :FloatermHide<CR><Bs><Bs><Bs>
" :nnoremap ffs :FloatermShow<CR><Bs><Bs><Bs>
" :nnoremap ffk :FloatermKill<CR>
" :tnoremap fft <C-\><C-n>:FloatermNew --height=0.9 --width=0.9 --wintype=float --name=Terminal <CR><Bs><Bs><Bs>
" :tnoremap ffg <C-\><C-n>:FloatermNew --height=0.9 --width=0.9 --wintype=float lazygit  <CR><Bs><Bs><Bs>
" :tnoremap ffd <C-\><C-n>:FloatermNew --height=0.9 --width=0.9 --wintype=float lazydocker <CR><Bs><Bs><Bs>
" :tnoremap ffp <C-\><C-n>:FloatermPrev<CR><Bs><Bs><Bs>
" :tnoremap ffn <C-\><C-n>:FloatermNext<CR><Bs><Bs><Bs>
" :tnoremap fff <C-\><C-n>:FloatermToggle --height=0.9 --width=0.9 --wintype=float<CR><Bs><Bs><Bs>  
" :tnoremap ff1 <C-\><C-n>:FloatermFirst<CR><Bs><Bs><Bs>  
" :tnoremap ff9 <C-\><C-n>:FloatermLast<CR> <Bs><Bs><Bs>
" :tnoremap ffh <C-\><C-n>:FloatermHide<CR><Bs><Bs><Bs>
" :tnoremap ffs <C-\><C-n>:FloatermShow<CR><Bs><Bs><Bs>
" :tnoremap ffk <C-\><C-n>:FloatermKill<CR><Bs><Bs><Bs>


