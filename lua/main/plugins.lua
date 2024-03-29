BootsrapLazy()

local ok1, lazy = pcall(require, "lazy")
if not ok1 then
  error("Lazy plugin not found")
end

local opts = CustomRequire('pluginOpts')
if not opts then
  error("Plugin configs file not found")
end

local flatten = {
  'willothy/flatten.nvim',
  opts = { window = { open = 'current' } },
  lazy = false,
  priority = 1001,
}

-- If opening from inside neovim terminal then do not load all the other plugins
if os.getenv("NVIM") ~= nil then
  require('lazy').setup(flatten)
  return
end

lazy.setup({ flatten,
  ------------------------------------
  -- Required Libraries
  ------------------------------------
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "xolox/vim-misc" },
  { "RishabhRD/popfix" },

  ------------------------------------
  -- Features
  ------------------------------------
  { "navarasu/onedark.nvim" },
  { 'marko-cerovac/material.nvim' },
  {
    "karb94/neoscroll.nvim",
    config = opts.neoscroll,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = opts.highlightColors,
  },
  {
    "hoob3rt/lualine.nvim",
    config = opts.lualine,
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
    }
  },
  { 'kosayoda/nvim-lightbulb', config = opts.lightbulb },
  { "tpope/vim-dadbod", },
  { "kristijanhusak/vim-dadbod-ui", },
  { "kristijanhusak/vim-dadbod-completion", },
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
  {
    "Jezda1337/nvim-html-css",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = opts.htmlcss 
  },
  { "nvim-treesitter/nvim-treesitter", config = opts.treesitter, },
  { "rafamadriz/friendly-snippets", },
  { "L3MON4D3/LuaSnip", },
  { "b0o/schemastore.nvim" },
  { "neovim/nvim-lspconfig", },
  {
    "williamboman/mason.nvim",
    config = opts.mason,
  },
  { "williamboman/mason-lspconfig.nvim", },
  {
    "nvimtools/none-ls.nvim",
    config = opts.none_ls,
    enabled = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = opts.signature,
  },
  ------------------------------------
  -- Additional  Functionality
  ------------------------------------
  { "folke/zen-mode.nvim", },
  {
    "kylechui/nvim-surround",
    config = opts.surround,
  },
  {
    "folke/lsp-trouble.nvim",
    config = opts.trouble
  },
  {
    "lewis6991/gitsigns.nvim",
    config = opts.gitsigns,
  },
  {
    "numToStr/Comment.nvim",
    config = opts.comments,
  },
  {
    "windwp/nvim-autopairs",
    config = opts.autopairs,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = opts.telescope,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    enabled = true,
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
    event = "vimenter",
  },
  {
    "mfussenegger/nvim-lint",
    config = opts.lint,
  },

  ------------------------------------
  -- Colorschemes
  ------------------------------------


}, opts.lazy())
