--
------------------------------------------------------------------
-- Vim Index Configuration File
------------------------------------------------------------------

-- User can change chosen profile by editing this value

PROFILE = 'test'
require('shared')

require(PROFILE .. '.settings')
require(PROFILE .. '.plugins')
require(PROFILE .. '.lsp')
require(PROFILE .. '.remaps')
require(PROFILE .. '.functions')
require(PROFILE .. '.styles')

------------------------------------------------------------------
-----------------------------------------------------------------

