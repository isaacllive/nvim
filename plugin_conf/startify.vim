
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
  \ { 'type': 'files',  'header': ['   Recent Files']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
  \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
  \ ]

let g:startify_commands = [
  \ { 't': 'term' }
  \ ]

let g:startify_bookmarks = [
  \ { 'c': '~/.config/nvim/init.vim' },
  \ { 'p': '~/.config/nvim/plugin.vim' },
  \ { 'b': '~/.bashrc' },
  \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_custom_header = [
  \'   ___      _            _           ', 
  \'  / _ \__ _| | ___/\   /(_)_ __ ___  ', 
  \' / /_\/ _` | |/ _ \ \ / / |  _ ` _ \ ', 
  \'/ /_\\ (_| | |  __/\ V /| | | | | | |', 
  \'\____/\__,_|_|\___(_)_/ |_|_| |_| |_|',
  \''
  \]

                                     

