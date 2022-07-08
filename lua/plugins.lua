
local fn = vim.fn
 -- Auto install Packer.nvim if not found
local	install_path = fn.stdpath('data')..'site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
 	Packer_Bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Auto Source This file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end 
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

require('packer').startup(function()

  -- packer itself
  use 'wbthomason/packer.nvim'

  -- Apearance 
  use 'sainnhe/sonokai'
  use 'navarasu/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'ap/vim-css-color'
  use 'hoob3rt/lualine.nvim'
  use 'marko-cerovac/material.nvim'
  use 'shaunsingh/nord.nvim'

  use 'glepnir/dashboard-nvim'
  use 'karb94/neoscroll.nvim'
  use 'rcarriga/nvim-notify'

  -- Required Libraries 
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'xolox/vim-misc'
  use 'RishabhRD/popfix'

  -- Aditional General Functionality
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-compe'
  use 'folke/lsp-trouble.nvim'
  use 'RishabhRD/nvim-lsputils'
  use 'kosayoda/nvim-lightbulb'
  use 'onsails/lspkind-nvim'
  use 'jubnzv/virtual-types.nvim'
  use 'jiangmiao/auto-pairs'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim' -- , { 'do': 'make' }
  use 'dhruvmanila/telescope-bookmarks.nvim'
  use 'rmagatti/auto-session'
  use 'ThePrimeagen/refactoring.nvim'

	-- Auto set config if packer was auto installed
	if Packer_Bootstrap then
		 require('packer').sync()
	end

end)

-- lua pluggin config
require('plugin_configs.dashboard')
require('plugin_configs.lsp')
require('plugin_configs.refactoring')
require('plugin_configs.treesitter')
require('plugin_configs.lsputils')
require('plugin_configs.compe')
require('plugin_configs.lsptrouble')
require('plugin_configs.gitsigns')
-- require('plugin_configs.telescope')
require('plugin_configs.lspkind')
require('plugin_configs.lualine')
require('plugin_configs.neoscroll')
require('plugin_configs.nvim-notify')
require('plugin_configs.auto-session')
