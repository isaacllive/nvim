


let g:session_directory = '~/.config/nvim/sessions'

let g:session_autosave = 'yes'
let g:session_autoload = 'no'
"let g:session_autosave_periodic = 5

let g:session_persist_globals = ['&sessionoptions']
call add(g:session_persist_globals, 'g:session_autoload')
call add(g:session_persist_globals, 'g:session_autosave')
"call add(g:session_persist_globals, 'g:session_autosave_periodic')
call add(g:session_persist_globals, 'g:session_persist_globals')


