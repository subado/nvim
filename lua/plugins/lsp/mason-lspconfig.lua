require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls', 'clangd', 'pylsp', 'bashls', 'html', 'tsserver', 'cssls', 'tailwindcss' },
}
