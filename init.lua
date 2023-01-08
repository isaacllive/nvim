
------------------------------------------------------------------
-- Vim Index Configuration File
------------------------------------------------------------------

PROFILE = 'default'        -- User can change chosen profile by editing this value
require('shared')          -- Shared Code between profiles

CustomRequire('custom')    -- autocommands functions custom commands
CustomRequire('plugins')   -- load plgins
CustomRequire('lsp')       -- load lsp features
CustomRequire('remaps')    -- custom remaps
CustomRequire('settings')  -- default vim settings 
CustomRequire('styles')    -- stylings
------------------------------------------------------------------
-----------------------------------------------------------------

