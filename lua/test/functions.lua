
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
  
  function! NeatFoldText() " ~f
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
  " f~ 
  
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
  
  " Basically to auto import definitions
]])

-- set this if you haven't set it elsewhere, ideally inside on_attach
vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

-- define global function
_G.lsp_import_on_completion = function()
    local completed_item = vim.v.completed_item
    if not (completed_item and completed_item.user_data and
        completed_item.user_data.nvim and completed_item.user_data.nvim.lsp and
        completed_item.user_data.nvim.lsp.completion_item) then return end

    local item = completed_item.user_data.nvim.lsp.completion_item
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.buf_request(bufnr, "completionItem/resolve", item,
                    function(_, _, result)
        if result and result.additionalTextEdits then
            vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr)
        end
    end)
end

-- define autocmd to listen for CompleteDone
vim.api.nvim_exec([[
augroup LSPImportOnCompletion
    autocmd!
    autocmd CompleteDone * lua lsp_import_on_completion()
augroup END
]], false)

