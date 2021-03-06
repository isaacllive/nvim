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


