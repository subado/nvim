local servers = {
    'lua_ls',
    'clangd',
    'pylsp',
    'bashls',
    'html',
    'tsserver',
    'cssls',
    'tailwindcss',
    'kotlin_language_server',
    'neocmake',
    'svelte',
}

local to_package = require('mason-lspconfig.mappings.server').lspconfig_to_package
local get_not_installed = require('plugins.mason.utils').get_not_installed
local ensure_installed = get_not_installed(servers, to_package)

require('mason-lspconfig').setup {
  ensure_installed = ensure_installed
}
