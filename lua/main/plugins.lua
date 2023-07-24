BootsrapLazy()

local ok1, lazy = pcall(require, "lazy")
if not ok1 then
  error("Lazy plugin not found")
end

local opts = CustomRequire('pluginOpts')
if not opts then
  error("Plugin configs file not found")
end

-- If opening from inside neovim terminal then do not load all the other plugins
if os.getenv("NVIM") ~= nil then
  require('lazy').setup {
    {
      'willothy/flatten.nvim',
      config = { window = { open = 'current' } },
      lazy = false,
      priority = 1001,
    },
  }
  return
end

lazy.setup({
  {
    'willothy/flatten.nvim',
    config = { window = { open = 'current' } },
    lazy = false,
    priority = 1001,
  },
  ------------------------------------
  -- Required Libraries
  ------------------------------------
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "xolox/vim-misc" },
  { "RishabhRD/popfix" },
  ------------------------------------
  -- Apearance
  ------------------------------------
  { "navarasu/onedark.nvim" },
  { "pantharshit00/vim-prisma" },
  { "karb94/neoscroll.nvim",
    config = opts.neoscroll,
  },
  { "brenoprata10/nvim-highlight-colors",
    config = opts.highlightColors,
  },
  { "hoob3rt/lualine.nvim",
    config = opts.lualine,
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
    }
  },
  ------------------------------------
  -- LSP
  ------------------------------------
  {
    "hrsh7th/nvim-cmp",
    config = opts.cmp,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "uga-rosa/cmp-dictionary" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-omni" },
      { "hrsh7th/cmp-cmdline" },
      { "dmitmel/cmp-cmdline-history" },
      { "lukas-reineke/cmp-rg" },
      { "petertriho/cmp-git" },
      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind.nvim" },
    },
  },
  { "rafamadriz/friendly-snippets", },
  { "L3MON4D3/LuaSnip", },
  { "b0o/schemastore.nvim" },
  { "neovim/nvim-lspconfig", },
  { "williamboman/mason.nvim",
    config = opts.mason,
  },
  { "williamboman/mason-lspconfig.nvim", },
  { "jose-elias-alvarez/null-ls.nvim",
    config = opts.null_ls,
    enabled = false,
  },
  { "ray-x/lsp_signature.nvim",
    config = opts.signature,
  },
  ------------------------------------
  -- Additional  Functionality
  ------------------------------------
  { "folke/zen-mode.nvim", },
  { "vimwiki/vimwiki", },
  { "iamcco/markdown-preview.nvim", },
  { "kylechui/nvim-surround",
    config = opts.surround,
  },
  { "nvim-treesitter/nvim-treesitter",
    config = opts.treesitter,
    enabled = true,
  },
  { "folke/lsp-trouble.nvim",
    config = opts.trouble
  },
  { "lewis6991/gitsigns.nvim",
    config = opts.gitsigns,
  },
  { "numToStr/Comment.nvim",
    config = opts.comments,
  },
  { "windwp/nvim-autopairs",
    config = opts.autopairs,
  },
  { "nvim-telescope/telescope.nvim",
    config = opts.telescope,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
    },
  },
  { "ThePrimeagen/refactoring.nvim",
    enabled = false,
    config = opts.refactoring,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  { "folke/noice.nvim",
    config = opts.noice,
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "vimenter",
  }
}, opts.lazy())
