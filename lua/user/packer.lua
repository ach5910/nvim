-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
-- packer.init {
--   snapshot = "v2.2",
-- }
-- /Users/aaronhunt/.cache/nvim_profiles/lsp-zero/nvim/packer.nvim/stable
local vscode = vim.g.vscode == 1
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim',
	  -- or                            , branch = '0.1.x',
    cond = function()
      return not vscode
    end,
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "akinsho/bufferline.nvim",
    cond = function()
      return not vscode
    end,
  } -- Add open buffer tabs
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
    cond = function()
      return not vscode
    end,
    -- config = function()
    --   vim.cmd('colorscheme rose-pine')
    -- end
  })
  use({
    "folke/tokyonight.nvim",
    -- as = 'tokyonight',
    cond = function()
      return not vscode
    end,
    config = function()
      vim.cmd('colorscheme tokyonight-moon')
    end
  })
  use {
    "EdenEast/nightfox.nvim",
    cond = function()
      return not vscode
    end,
  } -- Packer
  use {
    'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate',
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    cond = function()
      return not vscode
    end,
  }
  use {
    'theprimeagen/harpoon',
    cond = function()
      return not vscode
    end,
  }
  use {
    'mbbill/undotree',
    cond = function()
      return not vscode
    end,
  }

  use {
    "zbirenbaum/copilot.lua",
    cond = function()
      return not vscode
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    cond = function()
      return not vscode
    end,
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
  use("brenoprata10/nvim-highlight-colors") -- colors hex, rgb, hsl, etc
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
    cond = function()
      return not vscode
    end,
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
  use {
    'christoomey/vim-tmux-navigator',
    cond = function()
      return not vscode
    end,
  } -- Lets <C-h> and <C-l> nav to tmux
  use {
    "jose-elias-alvarez/null-ls.nvim",
    cond = function()
      return not vscode
    end,
  } -- allows formatters and linters to be lsps (enabled eslint_d)
  use {
    "kyazdani42/nvim-web-devicons",
    cond = function()
      return not vscode
    end,
  }
  use {
    "kyazdani42/nvim-tree.lua",
    cond = function()
      return not vscode
    end,
  }
  use {
    "RRethy/vim-illuminate",
  } -- Will soft highlight matches for cursor
  use {
    "lukas-reineke/indent-blankline.nvim",
    cond = function()
      return not vscode
    end,
  } -- Shows vertical line for blocks/scopes
  use {
    "moll/vim-bbye",
    cond = function()
      return not vscode
    end,
  } -- Allows bufferline to call Bdelete
  use {
    "nvim-lualine/lualine.nvim",
    cond = function()
      return not vscode
    end,
  } -- Provide botton line context
  use {
    "kylechui/nvim-surround",
  } -- Advance tpope surround
  use {
    "lewis6991/gitsigns.nvim",
    cond = function()
      return not vscode
    end,
  }
  use {
    "numToStr/Comment.nvim",
  } -- Allows auto commenting shortcut
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    cond = function()
      return not vscode
    end,
  } -- Support Comment.nvim for jsx commenting
  use {
    "goolord/alpha-nvim",
    cond = function()
      return not vscode
    end,
  } -- Empty screen prompt
  use {
    "windwp/nvim-autopairs",
  } -- Autopairs, integrates with both cmp and treesitter
  use {
    "antosha417/nvim-lsp-file-operations", -- Auto updates imports for open buffers when a file is moved 
    cond = function()
      return not vscode
    end,
    config = function ()
      require("lsp-file-operations").setup({})
    end
  }
  use('sindrets/diffview.nvim') -- Provides git diff view and file history
  use {
    'MeanderingProgrammer/markdown.nvim',
    as = "render-markdown", -- "render-markdown
    after = 'nvim-treesitter',
    cond = function()
      return not vscode
    end,
  }
end)
