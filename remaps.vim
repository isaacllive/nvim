

" Insert Mode ------------------------------------------------------
:imap jj <Esc>
"Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
:nmap <C-B> <C-v>

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

"Handles Termnial 
:au BufEnter * if &buftype == 'terminal' | exec 'normal! i' | set nonumber norelativenumber  | endif   "Always enter Terminal in insert mode and Remove numbers
:au BufEnter * if &buftype != 'terminal' | set number | endif  "Add numbers back when leaving terminal
:au TermOpen * startinsert
:au TermOpen * :set nonumber norelativenumber
:au TermOpen * noremap <buffer> <C-c> i<C-c>

" Custom commands
:command! Config e $MYVIMRC


