
" File for Customizing look n feel of nvim

:colorscheme nord
:hi Pmenu blend=0j

" Lightline Modifications
let g:lightline = {
\   'colorscheme' : 'wombat',
\   'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\     },
\     'component_function': {
\        'gitbranch': 'FugitiveHead'
\     }
\ }

" Netrw Modifications 
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3 
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 20


