require('lspconfig').clangd.setup {
	settings = {
		cpp = {
			cmd = { "clangd", "--completion-style=detailed" }
		},
	},
}
