local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path}
	vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])


return require('packer').startup(function()
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
	use 'arcticicestudio/nord-vim'

	-- Icons
	use 'onsails/lspkind-nvim'
	use 'ryanoasis/vim-devicons'
	use 'kyazdani42/nvim-web-devicons'

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

--[[
LSP
]]

	-- Collection of configurations for built-in LSP client
	use {
		'neovim/nvim-lspconfig',
	}
	use {
		'williamboman/nvim-lsp-installer',
	}

	use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

	use {
		'p00f/clangd_extensions.nvim',
		config = function()
			require('plugins.clangd')
		end
	}

--[[
Autocompletion
]]

	use {
		'hrsh7th/nvim-cmp',
		config = function()
			require('plugins.cmp')
		end,
	}
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'saadparwaiz1/cmp_luasnip'

	-- Autocompletion for file system
	use 'hrsh7th/cmp-path'

	-- Snippets plugin
	use 'L3MON4D3/LuaSnip'

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
			require('plugins.dap')
		end
	}

	use {
		"rcarriga/nvim-dap-ui",
		requires = {},
		config = function ()
			require('plugins.dap-ui')
		end,
	}

	use "Pocco81/DAPInstall.nvim"

-- [[
-- Sugar
-- ]]

	-- comfortable text commenting
	use 'b3nj5m1n/kommentary'

	use 'sharkdp/fd'

	if packer_bootstrap then
		require('packer').sync()
	end

	use 'powerman/vim-plugin-ruscmd'

	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
