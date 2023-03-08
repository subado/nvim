local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.stylua,
  formatting.prettier,
  formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
require('null-ls').setup {
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  on_init = function(new_client, _)
    new_client.offset_encoding = 'utf-16'
  end,
}
