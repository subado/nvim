require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "cpp", "python", "lua", "bash", "javascript", "tsx"}, -- Only use parsers that are maintained

	highlight = {
		enable = true
	},
	indent = {
		enable = true,
	},
}
