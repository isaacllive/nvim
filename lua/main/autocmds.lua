local autocmd = vim.api.nvim_create_autocmd

-- ---------------------------------------------------------------------------------------
-- Auto Commands
-- ---------------------------------------------------------------------------------------
autocmd({ "VimEnter" }, {
  desc = 'Custom start for neovim opens in terminal and dont open nested instances',
  callback = function()
    if os.getenv("NVIM") ~= nil then
      vim.cmd("q!")
      return
    else
      if vim.api.nvim_buf_get_name(0) == '' then
        vim.cmd("terminal tmux attach || tmux")
        vim.cmd("setlocal norelativenumber")
      end
    end
  end
})

autocmd('LspAttach', {
  desc = 'Enable LSP remaps when lsp attaches',
  callback = function(args)
    local lspRemaps = CustomRequire('remaps').remaps.lsp
    lspRemaps.setup()
  end
})

-- autocmd("CursorHold", {
--   desc = 'Automatically open lsp signatures',
--   callback = function(args)
--     local buf = args.buf
--     local clients = vim.lsp.buf_get_clients();
--     if next(clients) ~= nil then
--      for client in clients do
--       if client.supports_method('textDocument/signatureHelp') then
--         vim.lsp.buf.signature_help()
--       end
--     end
--     end
--   end
-- })

autocmd("CursorHold", {
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

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
 callback = function()
   local ok, lint = pcall(require, "lint")
   if not ok then
     lint.try_lint()
   end
 end
})

vim.cmd([[
  augroup terminal_handlers
    autocmd BufEnter  if &buftype == 'terminal'
         \  | setlocal nonumber norelativenumber
         \  | exec 'normal! i'
         \  | endif
    autocmd TermOpen * setlocal nonumber norelativenumber
         \  | let g:terminal_scrollback_buffer_size = 1
         \  | noremap <buffer> <C-c> i<C-c>
  augroup end
]])

vim.cmd([[
   augroup CmpDebounceAuGroup
     au!
     au TextChangedI *  lua Lsp_Debounce(500)
   augroup end
]])

-- WSL yank support; allows yanks to show in windows clipboard...
vim.cmd([[
  let s:clip = '/c/Windows/System32/clip.exe'  " change this path according to your mount point
  if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
  endif
]])
