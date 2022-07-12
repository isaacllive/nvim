
local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

-- local g = vim.g
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
    shortcut = 'SPC f f' },
  {
    icon = '  ',
    desc = 'Recently opened files                    ',
    action = 'DashboardFindHistory',
    shortcut = 'SPC f h' },
  {
    icon = '  ',
    desc = 'Find  word                               ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f g' },
  {
    icon = '  ',
    desc = 'Open Personal dotfiles                   ',
    action = 'Telescope dotfiles path=' .. home .. '/dotfiles/dotfiles',
    shortcut = 'SPC f d'
  },
}

db.custom_footer = {
  '',
  '',
  '-----------------------------------------------------------',
  'Plugins Loaded: ' .. plugins_count,
  '',
  '',
  '',
}
