-- /////////////
-- /// Setup ///
-- /////////////
-- Taken from https://github.com/wbthomason/packer.nvim#bootstrapping

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

-- ///////////////
-- /// Plugins ///
-- ///////////////

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- File tree viewer
use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    -- config = function() require'nvim-tree'.setup {} end
	config = function()
		require("plugins/nvim-tree")
	end
}

-- Native LSP
-- https://github.com/neovim/nvim-lspconfig
use {
    'neovim/nvim-lspconfig',
    config = function()
		require("plugins/lsp-config")
	end,
}

-- https://github.com/williamboman/nvim-lsp-installer
use {
	'williamboman/nvim-lsp-installer',
	config = function()
		require("plugins/lsp-installer")
	end,
}

-- Telescope fuzzy finder
-- Seems to work better than fzf for me
-- Plus, more plugin integration
-- https://github.com/nvim-telescope/telescope.nvim
use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
	config = function()
		require("plugins/telescope")
	end,
}

-- Tim Pope's fugitive, for git integration
use { 'tpope/vim-fugitive' }
-- Makes the :GBrowse command work
use { 'tpope/vim-rhubarb' }

-- Git diff and stuff in nvim
-- https://github.com/lewis6991/gitsigns.nvim
use {
	'lewis6991/gitsigns.nvim',
	requires = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		require("plugins/gitsigns")
	end,
	-- tag = 'release' -- To use the latest release
}

-- nvim-cmp
-- Autocompleter for LSP
-- https://github.com/hrsh7th/nvim-cmp
use {
  'hrsh7th/nvim-cmp',
  requires = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp'
    -- Not using cmdline because of wilder
    -- Plug 'hrsh7th/cmp-cmdline'
  },
  config = function()
		require("plugins/nvim-cmp")
	end,
}

-- Fancy icons for LSP using nvim-cmp
-- https://github.com/onsails/lspkind-nvim
use 'onsails/lspkind-nvim'

-- Tabnine source for autocompletion
-- https://github.com/tzachar/cmp-tabnine
-- ON HOLD UNTIL WINDOWS VERSION WORKS
use {
  'adrianiy/cmp-tabnine',
  -- run = './install.sh',
  requires = 'hrsh7th/nvim-cmp'
}

-- Vsnip
-- Needed for nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
use {
  'hrsh7th/vim-vsnip',
  requires = {
    'hrsh7th/vim-vsnip-integ',
  }
}

-- Friendly snippets
-- Needed for vsnip
-- https://github.com/rafamadriz/friendly-snippets
use "rafamadriz/friendly-snippets"

-- Colorscheme
use { 'mangeshrex/uwu.vim' }
-- Alternatively, use my own based on Dark Horizon from VSCode




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
