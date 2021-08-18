
" Remaping Leader
:let mapleader = " "

" Insert Mode ------------------------------------------------------
:imap kk <Esc>

"Format File
:nnoremap ff <cmd>lua vim.lsp.buf.formatting()<CR>

"Use <Tab> and <S-Tab> to navigate the completion list:
:inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Normal Mode -------------------------------------------------------
" :nnoremap <C-p> :Files<CR>

" Basic movement.
:noremap j <Left>
:noremap k <Down>
:noremap l <Up>
:noremap ; <Right>

" Tab-Bufferc Movement
:noremap <leader>bp :bprevious<CR>
:noremap <leader>bn :bnext<CR>
:noremap <leader>bb :enew<CR>
:noremap <leader>bd :bd<CR>

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
:tnoremap <C-v> <C-\><C-n><C-v>

" Automatic Commands 

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
  \  | :noremap <buffer> <C-c> i<C-c>         " Allows for C-c escaping process in terminal

" Custom commands
:command! Config e $MYVIMRC                   " Fast Config access

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>

 "tnoremap <leader>fc <C-\><C-n><cmd>lua require('telescope.builtin').commands()<cr>
 "tnoremap <leader>ff <C-\><C-n><cmd>lua require('telescope.builtin').find_files()<cr>
 "tnoremap <leader>fg <C-\><C-n><cmd>lua require('telescope.builtin').live_grep()<cr>
 "tnoremap <leader>fb <C-\><C-n><cmd>lua require('telescope.builtin').buffers()<cr>
 "tnoremap <leader>fh <C-\><C-n><cmd>lua require('telescope.builtin').help_tags()<cr>

