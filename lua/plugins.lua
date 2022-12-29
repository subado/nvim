--[[
if packer.nvim isn't installed then
the function will automatically install it and return true,
else it will simply return false
]]
local ensure_packer = function()
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
	return true
end
return false
end

local packer_bootstrap = ensure_packer()


-- configure Neovim to automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

return require('packer').startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

--[[
Appearance
]]

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('plugins.lualine')
		end,
	}
	--use 'feline-nvim/feline.nvim'

	-- Nord theme
	-- use 'arcticicestudio/nord-vim'

	-- Pywal
	use {
		'AlphaTechnolog/pywal.nvim',
		as = 'pywal',
		config = function()
			require('plugins.pywal')
		end,

	}

	-- Super fast git decorations
	use 'lewis6991/gitsigns.nvim'

	-- Tabs
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('plugins.bufferline')
		end,
	}

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins.treesitter')
		end,
	}

	-- Icons
	use {
		'onsails/lspkind.nvim',
		config = function()
			require('plugins.lspkind')
		end,
	}

--[[
LSP
]]
	-- Collection of configurations for built-in LSP client
	use {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
	}
	use {
		'p00f/clangd_extensions.nvim',
		config = function()
			require('plugins.clangd_extensions')
		end
	}

--[[
Autocompletion
]]

	use {
		'hrsh7th/nvim-cmp',

		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
		},

		config = function()
			require('plugins.cmp')
		end,
	}

	use {
		'L3MON4D3/LuaSnip',

		requires = {
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
		},
		config = function ()
			require'plugins.luasnip'
		end,
	}

-- [[
-- Files
-- ]]

	-- Highly extendable fuzzy finder
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require'plugins.tree'
		end,
	}

	-- Navigation in file between classes and functions
	use {
		'majutsushi/tagbar',
		config = function ()
			require('plugins.tagbar')
		end
	}

	-- Replacing fzf and ack
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function ()
			require'plugins.telescope'
		end,
	}

-- [[
-- Debug
-- ]]
	use {
		"mfussenegger/nvim-dap",
		config = function ()
			require('plugins.dap.init')
		end
	}

	use {
		"rcarriga/nvim-dap-ui",
	}

-- [[
-- Sugar
-- ]]
	use {
		"windwp/nvim-autopairs",
			config = function() require("nvim-autopairs").setup {} end
	}

	-- comfortable text commenting
	use 'b3nj5m1n/kommentary'

	use 'sharkdp/fd'

	if packer_bootstrap then
		require('packer').sync()
	end

	use 'powerman/vim-plugin-ruscmd'

	-- Adds indentation guides to all lines
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require'plugins.indent_blankline'
		end,
	}

	-- Highlight colors with neovim
	use 'brenoprata10/nvim-highlight-colors'

	-- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
	use({
			"iamcco/markdown-preview.nvim",
			run = function() vim.fn["mkdp#util#install"]() end,
			config = function()
				require 'plugins.markdown-preview'
			end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
