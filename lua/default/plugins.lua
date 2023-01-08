-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

local packerCheck = PackerInstalled()
packer.startup(function(use)
	local opts = CustomRequire("configs")
	if not opts then
		error("Config file not found exiting with error")
	end

	use("wbthomason/packer.nvim")
	------------------------------------
	-- Required Libraries
	------------------------------------
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "xolox/vim-misc" })
	use({ "RishabhRD/popfix" })
	------------------------------------
	-- Apearance
	------------------------------------
	use({ "navarasu/onedark.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "pantharshit00/vim-prisma" })
	use({ "hoob3rt/lualine.nvim", config = opts.lualine })
	use({ "karb94/neoscroll.nvim", config = opts.neoscroll })
	use({ "brenoprata10/nvim-highlight-colors", config = opts.highlightColors })
	------------------------------------
	-- LSP
	------------------------------------
	use({
		"hrsh7th/nvim-cmp",
		config = opts.cmp,
		requires = {
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
	})
	use({ "rafamadriz/friendly-snippets" })
	use({ "b0o/schemastore.nvim" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim", config = opts.null_ls })
	use({ "ray-x/lsp_signature.nvim", config = opts.signature })
	------------------------------------
	-- Additional  Functionality
	------------------------------------
	use({ "kylechui/nvim-surround", config = opts.surround, tag = "main" })
	use({ "lewis6991/impatient.nvim", config = opts.impatient })
	use({ "nvim-treesitter/nvim-treesitter", config = opts.treesitter })
	use({ "folke/lsp-trouble.nvim", config = opts.trouble })
	use({ "lewis6991/gitsigns.nvim", config = opts.gitsigns })
	use({ "numToStr/Comment.nvim", config = opts.comments })
	use({ "windwp/nvim-autopairs", config = opts.autopairs })
	use({ "kosayoda/nvim-lightbulb", config = opts.lightbulb, requires = "antoinemadec/FixCursorHold.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		config = opts.telescope,
		requires = { { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
	})

	use({
		"ThePrimeagen/refactoring.nvim",
		config = opts.refactoring,
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	------------------------------------
	-- Experimental
	------------------------------------
	use({ "rcarriga/nvim-notify", config = opts.notify, disable = true })
	use({
		"folke/noice.nvim",
		config = opts.noice,
		event = "VimEnter",
		disable = true,
		requires = { "MunifTanjim/nui.nvim" },
	})

	-- Auto set config if packer was auto installed
	if packerCheck then
		require("packer").sync()
	end
end)
