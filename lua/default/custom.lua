
-- ---------------------------------------------------------------------------------------
-- Vim Functions
-- ---------------------------------------------------------------------------------------
vim.cmd([[
  function! g:Term()
    let currdir = getcwd()
    execute termopen($SHELL." && cd ".currdir) 
  endfunction
  
  " WSL yank support; allows yanks to show in windows clipboard...
  let s:clip = '/c/Windows/System32/clip.exe'  " change this path according to your mount point
  if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
  endif
  
  function! NeatFoldText() 
    let line = '' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ''
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = ' ' 
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*1) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
  endfunction
  set foldtext=NeatFoldText()
  
]])

Sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

-- ---------------------------------------------------------------------------------------
-- Custom Commands
-- ---------------------------------------------------------------------------------------
vim.cmd [[ 
  command! Format execute 'lua vim.lsp.buf.format({ async = true })' 
]]


-- ---------------------------------------------------------------------------------------
--   Auto commands
-- ---------------------------------------------------------------------------------------
vim.cmd([[
  " Autosource when editing plugin files 
  augroup packer_user_config
    autocmd BufWritePost plugins.lua  source $MYVIMRC | PackerCompile
    autocmd BufWritePost configs.lua  source $MYVIMRC | PackerCompile
  augroup end

  "  Cleaner terminal experiance 
  augroup terminal_handlers 
    autocmd BufEnter  if &buftype == 'terminal' 
         \  | setlocal nonumber norelativenumber
         \  | exec 'normal! i'
         \  | endif   
    autocmd TermOpen * setlocal nonumber norelativenumber          
         \  | let g:terminal_scrollback_buffer_size = 1
         \  | noremap <buffer> <C-c> i<C-c>
  augroup end

  au BufNewFile,BufRead *.html set filetype=html
]])

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function()
  if vim.api.nvim_buf_get_name(0) == '' then
    vim.cmd("terminal")
    vim.cmd("setlocal norelativenumber")
  end
end
})

