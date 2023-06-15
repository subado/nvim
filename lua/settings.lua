local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local g = vim.g -- global variables

-- [[
-- Main
-- ]]

g.mapleader = ' '

vim.diagnostic.config {
  virtual_text = false,
  underline = true, -- Keep error underline
  signs = true, -- Keep gutter signs
}
