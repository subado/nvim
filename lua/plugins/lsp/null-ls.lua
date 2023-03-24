local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua,
  formatting.clang_format,
  formatting.autoflake,
  formatting.prettierd,
  formatting.codespell,
  formatting.eslint_d,
  code_actions.eslint_d,
  diagnostics.eslint_d.with {
    diagnostics_format = '[eslint] #{m}\n(#{c})',
  },
  diagnostics.codespell,
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
}
