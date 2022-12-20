require'nvim-treesitter.configs'.setup {
	ensure_installed = {"cpp", "python", "lua", "bash"}, -- Only use parsers that are maintained

	highlight = { -- enable highlighting
  enable = true,
	},

	indent = {
	  enable = true, -- default is disabled anyways
	}
}
