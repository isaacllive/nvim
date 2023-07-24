--
------------------------------------------------------------------
-- START: NeoVim Lua Index Configuration File
------------------------------------------------------------------

-- User can change chosen profile by editing this value
PROFILE = 'main'

-- Shared Code between profiles
require('shared')

CustomRequire('utils')
CustomRequire('autocmds')
CustomRequire('plugins')
CustomRequire('lsp')
CustomRequire('general')
CustomRequire('remaps').setup() -- custom remaps
CustomRequire('style')

------------------------------------------------------------------
-- END
------------------------------------------------------------------
--



