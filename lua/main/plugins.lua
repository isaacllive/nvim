BootsrapLazy()

local ok1, lazy = pcall(require, "lazy")
if not ok1 then
  error("Lazy plugin not found")
end

local opts = CustomRequire('configs')
if not opts then
  error("Plugin configs file not found")
end

lazy.setup({
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
  { "kyazdani42/nvim-web-devicons" },
  { "pantharshit00/vim-prisma" },
  { "karb94/neoscroll.nvim",
    config = opts.neoscroll,
    event = "VimEnter",
  },
  { "brenoprata10/nvim-highlight-colors",
    config = opts.highlightColors,
    event = "VimEnter",
  },
  { "hoob3rt/lualine.nvim",
    config = opts.lualine,
    event = "VimEnter",
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
    },
  },
  { "rafamadriz/friendly-snippets" },
  { "b0o/schemastore.nvim" },
  { "L3MON4D3/LuaSnip" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/null-ls.nvim",
    config = opts.null_ls
  },
  { "ray-x/lsp_signature.nvim",
    config = opts.signature
  },
  ------------------------------------
  -- Additional  Functionality
  ------------------------------------
  { "kylechui/nvim-surround",
    config = opts.surround,
    event = "VimEnter",
  },
  { "nvim-treesitter/nvim-treesitter",
    config = opts.treesitter
  },
  { "folke/lsp-trouble.nvim",
    config = opts.trouble
  },
  { "lewis6991/gitsigns.nvim",
    config = opts.gitsigns,
    event = "VimEnter",
  },
  { "numToStr/Comment.nvim",
    config = opts.comments,
    event = "VimEnter",
  },
  { "windwp/nvim-autopairs",
    config = opts.autopairs,
    event = "VimEnter",
  },
  { "kosayoda/nvim-lightbulb",
    config = opts.lightbulb,
    dependencies = "antoinemadec/FixCursorHold.nvim"
  },

  { "ahmedkhalf/project.nvim",
    config = opts.project,
    event = "VimEnter",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = opts.telescope,
    dependencies = { { 'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' } },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = opts.refactoring,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "folke/noice.nvim",
    config = opts.noice,
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VimEnter",
  }
}, opts.lazy())
