local M = {
  cmd = { 'clangd', '--completion-style=detailed', '--offset-encoding=utf-16' },
  on_attach = function(client, bufnr)
    require('clangd_extensions.inlay_hints').setup_autocmd()
    require('clangd_extensions.inlay_hints').set_inlay_hints()
  end,
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
}
return M
