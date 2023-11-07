local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {

  --[[ {
    'Wansmer/langmapper.nvim',
    config = function()
      require('plugins.langmapper')
    end,
  }, ]]

  -- [[
  -- Appearance
  -- ]]
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('plugins.vscode')
    end,
  },

  {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      -- require('plugins.catppuccin')
    end,
  },

  {
    'aktersnurra/no-clown-fiesta.nvim',
  },
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter')
    end,
  },
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.lualine')
    end,
  },
  -- Super fast git decorations
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end,
  }, -- Tabs
  {
    after = 'vscode.nvim',
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.bufferline')
    end,
  },
  -- Icons
  {
    'onsails/lspkind.nvim',
    config = function()
      require('plugins.lspkind')
    end,
  },
  -- [[
  -- LSP
  -- ]]
  -- Collection of configurations for built-in LSP client
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('plugins.lsp.init')
    end,
  },
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
  },
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('plugins.lsp.signature')
    end,
  },
  {
    'p00f/clangd_extensions.nvim',
    config = function()
      require('plugins.clangd_extensions')
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
  },
  -- [[
  -- Autocompletion
  -- ]]
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      require('plugins.cmp')
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('plugins.luasnip')
    end,
  },
  -- [[
  -- Files
  -- ]]

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.tree')
    end,
  },
  -- Navigation in file between classes and functions
  {
    'majutsushi/tagbar',
    config = function()
      require('plugins.tagbar')
    end,
  },
  -- Replacing fzf and ack
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.telescope')
    end,
  },
  -- [[
  -- Debug
  -- ]]
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jayp0521/mason-nvim-dap.nvim',
      'mfussenegger/nvim-dap-python'
    },
    config = function()
      require('plugins.dap.init')
    end,
  },
  -- [[
  -- Sugar
  -- ]]
  {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.autopairs')
    end,
  },
  -- comfortable text commenting
  'b3nj5m1n/kommentary',

  -- Adds indentation guides to all lines
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent_blankline')
    end,
  },
  -- Highlight colors with neovim
  {
    'uga-rosa/ccc.nvim',
    config = function()
      require('plugins.ccc')
    end,
  },
  -- Experimental treesitter based neovim plugin to create intelligent implementations for C++
  {
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    'Badhi/nvim-treesitter-cpp-tools',
    config = function()
      require('plugins.treesitter-cpp-tools')
    end,
  },
  -- [[
  -- Filetype support
  -- ]]
  -- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
  {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      require('plugins.markdown-preview')
    end,
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = function()
      require('plugins.rainbow_csv')
    end,
    ft = {
        'csv',
        'tsv',
        'csv_semicolon',
        'csv_whitespace',
        'csv_pipe',
        'rfc_csv',
        'rfc_semicolon'
    },
    cmd = {
        'RainbowDelim',
        'RainbowDelimSimple',
        'RainbowDelimQuoted',
        'RainbowMultiDelim'
    }  },
  {
    'phelipetls/vim-hugo',
  },
  {
      'danymat/neogen',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      config = function()
        require('plugins.neogen')
      end,
      -- Uncomment next line if you want to follow only stable versions
      -- version = '*'
  },
}
