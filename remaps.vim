
" Remaping Leader
:let mapleader = " "

" ----------------------------------------------------------------------------------------
" Visual Mode 
" ----------------------------------------------------------------------------------------
:imap kk <Esc>
:imap <leader>n <Esc>

"Use <Tab> and <S-Tab> to navigate the completion list:
:inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ----------------------------------------------------------------------------------------
" Normal Mode 
" ----------------------------------------------------------------------------------------

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

" Format File
:nnoremap ff <cmd>lua vim.lsp.buf.format { async = true }<CR>

" Add fucntionality for gf to open file
:noremap gf :e <cfile><cr>

" Telescope remaps
:nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
:nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
:nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
:nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
:nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>
:nnoremap <leader>r <cmd>lua require('telescope.builtin').lsp_references()<cr>
:nnoremap <leader>s <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
:nnoremap <leader>ss <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
:nnoremap <leader>c <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
:noremap <leader>e <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
:nnoremap <leader>ee <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>
:nnoremap <leader>i <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
:nnoremap <leader>d <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

" ----------------------------------------------------------------------------------------
" Terminal Mode 
" ----------------------------------------------------------------------------------------
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-j> <C-\><C-n><C-W>j<C-W>
:tnoremap <A-k> <C-\><C-n><C-W>k<C-W>
:tnoremap <A-h> <C-\><C-n><C-W>h<C-W>
:tnoremap <A-l> <C-\><C-n><C-W>l<C-W>
:tnoremap <C-v> <C-\><C-n><C-v>

" ----------------------------------------------------------------------------------------
"  Visual Mode 
" ----------------------------------------------------------------------------------------
" Yanking in visual mode copies text to win clipboard
:vnoremap <y> *y






