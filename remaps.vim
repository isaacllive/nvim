
" Remaping Leader
:let mapleader = " "

" Insert Mode ------------------------------------------------------
:imap kk <Esc>
:imap <leader>n <Esc>
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

:noremap <leader>tp :tabprevious<CR>
:noremap <leader>tn :tabNext<CR>
:noremap <leader>td :tabclose<CR>
:noremap <leader>tt :tabnew<CR>

" Split Movement
:noremap <A-j> <C-W>h<C-W><CR>
:noremap <A-k> <C-W>j<C-W><CR>
:noremap <A-l> <C-W>k<C-W><CR>
:noremap <A-;> <C-W>l<C-W><CR>

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
  \  | :let g:terminal_scrollback_buffer_size = 1
  \  | :noremap <buffer> <C-c> i<C-c>         " Allows for C-c escaping process in terminal

" Custom commands
:command! ConfigFile e $MYVIMRC                     " Fast Main kConfig access
:command! ConfigSSH e ~/.ssh/config                 " Fast SSH Config access
:command! ConfigPlugins e ~/.config/nvim/plugin.vim " fast plugin config access
:command! ConfigBash e ~/.bashrc                    " fast fish config access

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>r <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>ss <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <leader>c <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
noremap <leader>e <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <leader>ee <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>
nnoremap <leader>i <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
nnoremap <leader>d <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

function g:Term()
  let currdir = getcwd()
  execute termopen($SHELL." && cd ".currdir) 
endfunction





