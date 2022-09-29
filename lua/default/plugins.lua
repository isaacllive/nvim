local fn = vim.fn

-- Auto install Packer.nvim if not found
local install_path = fn.stdpath('data') .. 'site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
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

packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- Required Libraries
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'xolox/vim-misc'
  use 'RishabhRD/popfix'

  -- Apearance
  use 'navarasu/onedark.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use { 'rcarriga/nvim-notify',
    config = function() require(PROFILE .. '.plugin_configs.nvim-notify') end }

  use { 'hoob3rt/lualine.nvim',
    config = function() require(PROFILE .. '.plugin_configs.lualine') end }

  use { 'karb94/neoscroll.nvim',
    config = function() require(PROFILE .. '.plugin_configs.neoscroll') end }

  use { 'brenoprata10/nvim-highlight-colors',
    config = function() require('nvim-highlight-colors').setup { render = 'background' } end }

  use 'pantharshit00/vim-prisma'

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'uga-rosa/cmp-dictionary' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-omni' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'dmitmel/cmp-cmdline-history' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'petertriho/cmp-git' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- Aditional  Functionality
  use { 'lewis6991/impatient.nvim',
    config = function() require(PROFILE .. '.plugin_configs.impatient') end }

  use { 'nvim-treesitter/nvim-treesitter',
    config = function() require(PROFILE .. '.plugin_configs.treesitter') end }

  use { 'folke/lsp-trouble.nvim',
    config = function() require(PROFILE .. '.plugin_configs.lsptrouble') end }

  use { 'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = function() require(PROFILE .. '.plugin_configs.lightbulb') end }

  use 'RRethy/vim-illuminate'

  use 'jubnzv/virtual-types.nvim'

  use { 'lewis6991/gitsigns.nvim',
    config = function() require(PROFILE .. '.plugin_configs.gitsigns') end }

  use { 'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } },
    config = function() require('telescope').load_extension('fzf') end }

  use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end }

  use { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end }

  -- use 'ThePrimeagen/refactoring.nvim'

  -- Auto set config if packer was auto installed
  if Packer_Bootstrap then
    require('packer').sync()
  end

end)

-- require(PROFILE .. '.plugin_configs.refactoring')
--require(PROFILE .. '.plugin_configs.telescope') -- TODO: FIX ERRORS
