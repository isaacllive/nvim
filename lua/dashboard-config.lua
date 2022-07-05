
local db = require('dashboard')

local g = vim.g
local fn = vim.fn
local home = os.getenv('HOME');
local plugins_count = fn.len(fn.globpath("~/.config/nvim/plugged", "*", 0, 1))


db.custom_header = {
 '',
 '',      
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
 '',
 '-----------------------------------------------------------',
 '',      
 '',      
 'MAIN MENU',      
 '',      
 '',      
}                                       
                                        
-- TODO make these actually work
db.custom_center = {
    {
      icon = '  ',
      desc = 'Find  File                               ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
    {
      icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='SessionLoad'},
    {
      icon = '  ',
      desc = 'Recently opened files                    ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
    {
      icon = '  ',
      desc = 'Find  word                               ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f g'},
    {
      icon = '  ',
      desc = 'Open Personal dotfiles                   ',
      action = 'Telescope dotfiles path=' .. home ..'/dotfiles/dotfiles',
      shortcut = 'SPC f d'
    },
  }

db.custom_footer = {
 '',
 '',      
 '-----------------------------------------------------------',
 '',      
 '',      
 '',      
 '',      
}                                       
--  -- Highlight Group
--  DashboardHeader DashboardCenter DashboardCenterIcon DashboardShortCut DashboardFooter
--  
--  -- Command
--  
--  DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
-- SessionSave,SessionLoad



