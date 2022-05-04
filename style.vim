
" File for Customizing look n feel of nvim
:hi Pmenu blend=0

" Important!!
if has('termguicolors')
  set termguicolors
endif

"" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
"" Available values: `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'`


" Netrw Modifications 
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 3
let g:netrw_winsize = 20
let g:netrw_liststyle = 3

:colorscheme sonokai 






