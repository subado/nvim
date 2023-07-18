local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  -- Formatting
  formatting.stylua,
  formatting.clang_format,
  formatting.autoflake,
  formatting.prettierd,
  formatting.xmlformat,
  formatting.codespell,
  formatting.shellharden,
  formatting.shfmt,
  formatting.eslint_d,
  -- Code actions
  code_actions.shellcheck,
  code_actions.eslint_d,
  -- Diagnostics
  diagnostics.eslint_d.with {
    diagnostics_format = '[eslint] #{m}\n(#{c})',
  },
  diagnostics.codespell,
}
local no_auto_formatting = { 'sh' }
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    for _, name in ipairs(no_auto_formatting) do
      if name == vim.filetype.match { buf = bufnr } then
        return
      end
    end
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
