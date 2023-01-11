-- ---------------------------------------------------------------------------------------
-- Vim Functions
-- ---------------------------------------------------------------------------------------

function HasCharBehindCursor()
  local has = false
  local previousChar = ' '
  local get_lines = vim.api.nvim_buf_get_lines
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  if col ~= 0 then
    previousChar = get_lines(0, line - 1, line, true)[1]
    previousChar = string.sub(previousChar, col, col)
  end
  has = string.match(previousChar, '%g') ~= nil
  return has
end

function Sign(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

function Lsp_Debounce(DEBOUNCE_DELAY)
  local ok, cmp = pcall(require, 'cmp')
  if ok then
    local timer = vim.loop.new_timer()
    timer:start(
      DEBOUNCE_DELAY,
      0,
      vim.schedule_wrap(function()
        cmp.complete({ reason = cmp.ContextReason.Auto })
      end)
    )
    timer:stop()
  end
end

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

-- ---------------------------------------------------------------------------------------
-- Custom Commands
-- ---------------------------------------------------------------------------------------
vim.cmd(":command! Format execute 'lua vim.lsp.buf.format({ async = true })'")
vim.cmd(":command! Close bufdo bd | q!")
vim.cmd(":command! ConfigMain e $MYVIMRC")
vim.cmd(":command! ConfigSSH e ~/.ssh/config")
vim.cmd(":command! ConfigShell e $SHELL_RC")
vim.cmd(":command! ConfigPluginList e ~/.config/nvim/lua/" .. GetProfile() .. "/plugins.lua")
vim.cmd(":command! ConfigPluginOpts e ~/.config/nvim/lua/" .. GetProfile() .. "/configs.lua")
vim.cmd(":command! ConfigLspServers e ~/.config/nvim/lua/" .. GetProfile() .. "/ls_configs.lua")

-- ---------------------------------------------------------------------------------------
--   Auto commands
-- ---------------------------------------------------------------------------------------
vim.cmd([[
  "  Cleaner terminal experience 
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

vim.cmd([[
   augroup CmpDebounceAuGroup
     au!
     au TextChangedI *  lua Lsp_Debounce(500)
   augroup end
]])

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  desc = 'disable line numbers for initial terminal',
  callback = function()
    if vim.api.nvim_buf_get_name(0) == '' then
      vim.cmd("terminal")
      vim.cmd("setlocal norelativenumber")
    end
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable LSP remaps when lsp attaches',
  callback = function()
    local lspRemaps = CustomRequire('remaps').remaps.lsp
    lspRemaps.setup()
  end
})

vim.api.nvim_create_autocmd("CursorHold", {
  desc = 'Automatically open diagnostics floats',
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

vim.api.nvim_create_autocmd("TextChangedI,TextChangedP", {
  desc = 'Custom trigger for nvim_cmp completion',
  callback = function()
    local ok, cmp = pcall(require, 'cmp')
    if ok then
      if HasCharBehindCursor() then
        cmp.complete()
      end
    end
  end
})
