
-- ---------------------------------------------------------------------------------------
-- Vim Functions
-- ---------------------------------------------------------------------------------------

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

function HasCharBehindCursor()
  local has = false
  local previousChar = ' '
  local get_lines = vim.api.nvim_buf_get_lines
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  if col ~= 0 then
    local currLine = get_lines(0, line - 1, line, true)[1]
    --!print('line:' .. currLine)
    previousChar = string.sub(currLine, col, col)
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

vim.cmd([[
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


