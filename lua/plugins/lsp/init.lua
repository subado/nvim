require('plugins.lsp.mason')
require('plugins.lsp.mason-lspconfig')
require('plugins.lsp.settings.sumneko_lua')
require('plugins.lsp.settings.pylsp')
require('plugins.lsp.settings.clangd')
require('plugins.lsp.handlers').setup{}
require('plugins.lsp.null-ls')
