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

  -- packer itself
  use 'wbthomason/packer.nvim'

  -- Required Libraries
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'xolox/vim-misc'
  use 'RishabhRD/popfix'

  -- Apearance
  use 'navarasu/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'
 -- use 'glepnir/dashboard-nvim'
  use 'karb94/neoscroll.nvim'
  use 'rcarriga/nvim-notify'
  use { 'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {
        render = 'background'
      }
    end
  }
  use 'pantharshit00/vim-prisma'


  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'uga-rosa/cmp-dictionary'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-omni'
  use 'hrsh7th/cmp-cmdline'
  use 'dmitmel/cmp-cmdline-history'
  use 'lukas-reineke/cmp-rg'
  use 'petertriho/cmp-git'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Aditional  Functionality
  use 'lewis6991/impatient.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'folke/lsp-trouble.nvim'
  use { 'kosayoda/nvim-lightbulb', requires = 'antoinemadec/FixCursorHold.nvim', }
  use 'RRethy/vim-illuminate'
  use 'jubnzv/virtual-types.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
    config = function()
      require('telescope').load_extension('fzf')
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}

    end
  }
  -- use 'ThePrimeagen/refactoring.nvim'

  -- Auto set config if packer was auto installed
  if Packer_Bootstrap then
    require('packer').sync()
  end

  --use({
  --	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --	config = function()
  --		require("lsp_lines").setup()
  --		vim.wo.signcolumn = "yes"
  --	end,
  --})

end)

--require(PROFILE .. '.plugin_configs.telescope') -- TODO: FIX ERRORS
require(PROFILE .. '.plugin_configs.impatient')
require(PROFILE .. '.plugin_configs.dashboard') -- TODO: DESIGN BETTER LOOKING PAGE
require(PROFILE .. '.plugin_configs.treesitter')
require(PROFILE .. '.plugin_configs.refactoring')
require(PROFILE .. '.plugin_configs.lsptrouble')
require(PROFILE .. '.plugin_configs.gitsigns')
require(PROFILE .. '.plugin_configs.lualine')
require(PROFILE .. '.plugin_configs.neoscroll')
require(PROFILE .. '.plugin_configs.nvim-notify')
require(PROFILE .. '.plugin_configs.lightbulb')
