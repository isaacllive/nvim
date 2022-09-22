--
------------------------------------------------------------------
-- Vim Index Configuration File
------------------------------------------------------------------
--
-- User can change chosen profile by editing this value
PROFILE = 'default'
require('shared')

require(PROFILE .. '.styles')
require(PROFILE .. '.functions')
require(PROFILE .. '.plugins')
require(PROFILE .. '.lsp')
require(PROFILE .. '.settings')
require(PROFILE .. '.remaps')

------------------------------------------------------------------
-----------------------------------------------------------------
--

vim.cmd([[ 
  au BufNewFile,BufRead *.html set filetype=html
]])

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function()
    if vim.api.nvim_buf_get_name(0) == '' then
      vim.cmd("set nonumber norelativenumber")
      vim.cmd("terminal")
    end
  end
})
