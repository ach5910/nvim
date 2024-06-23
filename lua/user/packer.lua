-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
packer.init {
  snapshot = "stable2",
}
-- /Users/aaronhunt/.cache/nvim_profiles/lsp-zero/nvim/packer.nvim/stable
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use("akinsho/bufferline.nvim") -- Add open buffer tabs
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
    -- config = function()
    --   vim.cmd('colorscheme rose-pine')
    -- end
  })
  use({
    "folke/tokyonight.nvim",
    -- as = 'tokyonight',
    config = function()
      vim.cmd('colorscheme tokyonight-moon')
    end
  })
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )
  use('nvim-treesitter/nvim-treesitter-context')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }
  use('christoomey/vim-tmux-navigator') -- Lets <C-h> and <C-l> nav to tmux
  use("jose-elias-alvarez/null-ls.nvim") -- allows formatters and linters to be lsps (enabled eslint_d)
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("RRethy/vim-illuminate") -- Will soft highlight matches for cursor
  use("lukas-reineke/indent-blankline.nvim") -- Shows vertical line for blocks/scopes
  use("moll/vim-bbye") -- Allows bufferline to call Bdelete
  use("nvim-lualine/lualine.nvim") -- Provide botton line context
  use("kylechui/nvim-surround") -- Advance tpope surround
  use("lewis6991/gitsigns.nvim")
  use("numToStr/Comment.nvim") -- Allows auto commenting shortcut
  use("JoosepAlviste/nvim-ts-context-commentstring") -- Support Comment.nvim for jsx commenting
  use("goolord/alpha-nvim") -- Empty screen prompt
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use {
    "antosha417/nvim-lsp-file-operations", -- Auto updates imports for open buffers when a file is moved 
    config = function ()
      require("lsp-file-operations").setup({ debug = true })
    end
  }
  use('sindrets/diffview.nvim') -- Provides git diff view and file history
end)
