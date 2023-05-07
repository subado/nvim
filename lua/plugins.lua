--[[
if packer.nvim isn't installed then
the function will automatically install it and return true,
else it will simply return false
]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd([[packadd packer.nvim]])
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
  use('wbthomason/packer.nvim')

  --[[ use {
    'Wansmer/langmapper.nvim',
    config = function()
      require('plugins.langmapper')
    end,
  } ]]
  --[[
Appearance
]]
  use {
    'Mofiqul/vscode.nvim',
    config = function()
      require('plugins.vscode')
    end,
  }

  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      -- require('plugins.catppuccin')
    end,
  }

  use {
    'aktersnurra/no-clown-fiesta.nvim',
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter')
    end,
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.lualine')
    end,
  }

  -- Super fast git decorations
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end,
  }
  -- Tabs
  use {
    after = 'Mofiqul/vscode.nvim',
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.bufferline')
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
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'ray-x/lsp_signature.nvim',
    },
    config = function()
      require('plugins.lsp.init')
    end,
  }

  use {
    'p00f/clangd_extensions.nvim',
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
      'subado/friendly-snippets',
    },
    config = function()
      require('plugins.luasnip')
    end,
  }

  -- [[
  -- Files
  -- ]]

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.tree')
    end,
  }

  -- Navigation in file between classes and functions
  use {
    'majutsushi/tagbar',
    config = function()
      require('plugins.tagbar')
    end,
  }

  -- Replacing fzf and ack
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('plugins.telescope')
    end,
  }

  -- [[
  -- Debug
  -- ]]
  use {
    'mfussenegger/nvim-dap',
    config = function()
      require('plugins.dap.init')
    end,
  }

  use {
    'rcarriga/nvim-dap-ui',
  }

  use {
    'jayp0521/mason-nvim-dap.nvim',
  }

  use {
    'mfussenegger/nvim-dap-python',
  }

  -- [[
  -- Sugar
  -- ]]
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.autopairs')
    end,
  }

  -- comfortable text commenting
  use('b3nj5m1n/kommentary')

  if packer_bootstrap then
    require('packer').sync()
  end

  -- Adds indentation guides to all lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent_blankline')
    end,
  }

  -- Highlight colors with neovim
  use('brenoprata10/nvim-highlight-colors')

  -- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      require('plugins.markdown-preview')
    end,
  }

  -- Experimental treesitter based neovim plugin to create intelligent implementations for C++
  use {
    requires = { 'nvim-treesitter/nvim-treesitter' },
    'Badhi/nvim-treesitter-cpp-tools',
    config = function()
      require('plugins.treesitter-cpp-tools')
    end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
