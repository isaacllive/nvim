------------------------------------------------------------------------
-- General vim settings
------------------------------------------------------------------------

vim.o.ch = 0
vim.o.relativenumber = true
vim.wo.wrap = false

vim.cmd([[
  " :set spell
  " :setlocal spelllang=en_us,es_pr
  :set shortmess+=A                        " Ignore swap files 
  :set relativenumber                      " Line numbers
  :set mouse=a                             " Enable your mouse
  :set hidden                              " Required to keep multiple buffers open multiple buffers
  :set nowrap                              " Display long lines as just one line
  :set encoding=utf-8                      " The encoding displayed
  :set pumheight=10                        " Makes popup menu smaller
  :set fileencoding=utf-8                  " The encoding written to file
  :set ruler              	               " Show the cursor position all the time
  :set iskeyword+=-                        " treat dash separated words as a word text object"
  :set splitbelow                          " Horizontal splits will automatically be below
  :set splitright                          " Vertical splits will automatically be to the right
  :set t_Co=256                            " Support 256 colors
  :set conceallevel=0                      " So that I can see `` in markdown files
  :set tabstop=2                           " Insert 2 spaces for a tab
  :set shiftwidth=2                        " Change the number of space characters inserted for indentation
  :set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
  :set expandtab                           " Converts tabs to spaces
  :set smartindent                         " Makes indenting smart
  :set autoindent                          " Good auto indent
  :set laststatus=3                        " Always display the status line
  :set cursorline                          " Enable highlighting of the current line
  " :set background=dark                     " tell vim what the background color looks like
  :set showtabline=2                       " Present Airblade Status Line 
  :set nobackup                            " This is recommended by coc
  :set nowritebackup                       " This is recommended by coc
  :set updatetime=300                      " Faster completion
  :set timeoutlen=500                      " By default timeoutlen is 1000 ms
  :set formatoptions-=cro                  " Stop newline continution of comments
  :set clipboard=unnamedplus               " Copy paste between vim and everything else
  :set showcmd                             " Show commands that you type 
  :set confirm                             " Confirm when exiting without save
  :set noshowmode                          " Don't show mode covered by lighline
  :set shortmess+=c                        " Don't show 'pattern not found prompt 
  :set nocompatible
  :set foldmethod=marker                   " De   
  :set foldmarker=~f,f~
  :set foldlevel=0                         " Determine fold level
  :set wmh=0
  :filetype plugin on                      " File type recognition for plugin files

  " let g:tpipeline_autoembed = 0
  " :set cmdheight=0
]])

-- ---------------------------------------------------------------------------------------
-- Custom Commands
-- ---------------------------------------------------------------------------------------

local usercmd = vim.api.nvim_create_user_command

vim.cmd(":command! Clean :%s/\r//g")
vim.cmd(":command! Format execute 'lua vim.lsp.buf.format({ async = true })'")
vim.cmd(":command! Close bufdo bd | q!")
vim.cmd(":command! EditSshConfig e ~/.ssh/config")
vim.cmd(":command! EditShellConfig e $SHELL_RC")
vim.cmd(":command! EditInitFile e $MYVIMRC")
vim.cmd(":command! EditLsp e ~/.config/nvim/lua/" .. GetProfile() .. "/lsp.lua")
vim.cmd(":command! EditRemaps e ~/.config/nvim/lua/" .. GetProfile() .. "/remaps.lua")
vim.cmd(":command! EditAutoCmds e ~/.config/nvim/lua/" .. GetProfile() .. "/autocmds.lua")
vim.cmd(":command! EditGeneralOpts e ~/.config/nvim/lua/" .. GetProfile() .. "/general.lua")
vim.cmd(":command! EditPluginList e ~/.config/nvim/lua/" .. GetProfile() .. "/plugins.lua")
vim.cmd(":command! EditPluginOpts e ~/.config/nvim/lua/" .. GetProfile() .. "/pluginOpts.lua")
vim.cmd(":command! EditLspServers e ~/.config/nvim/lua/" .. GetProfile() .. "/lsOpts.lua")
vim.cmd(":command! EditStyle e ~/.config/nvim/lua/" .. GetProfile() .. "/style.lua")
vim.cmd(":command! EditUtils e ~/.config/nvim/lua/" .. GetProfile() .. "/utils.lua")

vim.cmd([[
  function! g:Term()
    let currdir = getcwd()
    execute termopen($SHELL." && cd ".currdir)
  endfunction
]])

