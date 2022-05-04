
let g:startify_lists = [
  \ { 'type': 'files',  'header': ['   Recent Files']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

let g:startify_commands = [
  \ { 's': 'OpenSession' },
  \ { 'f': 'Telescope find_files'}, 
  \ { 'c': 'ConfigFile' },
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

                                     

