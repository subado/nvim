local options = {
  termguicolors = true, -- h24-bit RGB colors
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = -1,
  autoindent = true,
  smartindent = true,
  expandtab = true,
  smarttab = true,
  cindent = true,
  cino = 'g0:0',
  number = true,             -- lines numeration
  relativenumber = true,     -- number relative current line number
  so = 999,                  -- cursor always in center
  backup = false,            -- creates a backup file
  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
  showmode = false,          -- we don't need to see things like -- INSERT -- anymore
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.g.mapleader = '<Backslash>'
vim.g.maplocalleader = ';'
