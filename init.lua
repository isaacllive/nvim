--
------------------------------------------------------------------
-- START: NeoVim Lua Index Configuration File
------------------------------------------------------------------

-- User can change chosen profile by editing this value
PROFILE = 'main'

-- Shared Code between profiles
require('shared')

-- Load custom; cmds, autocmds, functions
CustomRequire('custom')

-- load plugins
CustomRequire('plugins')

-- Initialize Lsp Features
CustomRequire('lsp')

-- Apply default vim settings
CustomRequire('settings')

-- Apply default remaps
CustomRequire('remaps').setup() -- custom remaps

-- Apply style options
CustomRequire('styles')

------------------------------------------------------------------
-- END
------------------------------------------------------------------
--
