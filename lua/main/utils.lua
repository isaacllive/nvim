
-- ---------------------------------------------------------------------------------------
-- Vim Functions
-- ---------------------------------------------------------------------------------------
--

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



local function Test()
    local M = {}
    -- Create a custom apigen namespace to make sure we don't mess
    -- with other diagnostics.
    M.namespace = vim.api.nvim_create_namespace("apigen")

    -- Create an autocommand which will run the check_current_buffer
    -- function whenever we enter or save the buffer.
    vim.api.nvim_create_autocmd({"BufWritePost", "BufEnter"}, {
        group = vim.api.nvim_create_augroup("ApiGen", { clear = true }),
        -- apigen currently only parses annotations within *.api.go
        -- files so those are the only files we want to check within
        -- neovim as well.
        -- pattern = "*.api.go",
        callback = M.check_current_buffer,
    })

  return M
end

local function Test2()
    -- Reset all diagnostics for our custom namespace. The second
    -- argument is the buffer number and passing in 0 will select
    -- the currently active buffer.
    vim.diagnostic.reset(M.namespace, 0)

    -- Get the path for the current buffer so we can pass that into
    -- the command below.
    local buf_path = vim.api.nvim_buf_get_name(0)

    -- Running `apigen -check FILE_PATH` will print error messages
    -- to stderr but won't generate any code.
    local cmd = "apigen -check " .. buf_path

    -- You can also use vim.fn.system to run an external command.
    -- In our case the error output is printed on multiple lines.
    -- The first line will print "LINE:COL" and the second line the
    -- error message itself. vim.fn.systemlist will return a lua
    -- table containing each line instead of a single string. 
    local output = vim.fn.systemlist(cmd)
    local exit_code = vim.v.shell_error

    -- `apigen` exits with 0 on success and greater zero on error
    if (exit_code ~= 0) then
        -- parse line and col from the first line of the output
        -- TODO: should probably do some error checking here ;)
        local line, col = string.match(output[1], "(%d+):(%d+)")

        -- vim.diagnostic.set allows you to set multiple diagnostics
        -- for the given buffer. We only set one because `apigen`
        -- currently exits on the first error it finds.
        vim.diagnostic.set(M.namespace, 0, {
            {
                lnum = tonumber(line),
                col = tonumber(col),
                message = output[2]
            }
        })
    end
end


function CheckLineForDiagnostic()
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = lsp_util.make_range_params()
  params.context = context
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, result)
    -- do something with result - e.g. check if empty and show some indication
  end)
end

