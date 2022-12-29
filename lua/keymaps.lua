local opts = { noremap = true, silent = true }

local map = require('maps').map
local bmap = require('maps').bmap

--[[
Simple maps
 ]]
map('n', '<leader>/', ':nohl<CR>', opts)
map('', '<leader>sf', [[:%s/\ \ \ \ /\t/g<CR>]], opts)
map('', '<leader>st', [[:%s/\ \ /\t/g<CR>]], opts)
map('v', '<Tab>', [[: ><CR>]], opts)
map('v', '<S-Tab>', [[: <<CR>]], opts)
map('n', '<C-h>', '<Left>', opts)
map('n', '<C-l>', '<Right>', opts)

--[[
Telescope
 ]]
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)

--[[
Bufferline
 ]]
map('n', '<A-TAB>', ':BufferLineCycleNext<CR>', opts)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<C-d>', ':BufferLinePickClose<CR>', opts)

--[[
NvimTree
 ]]
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

--[[
Tagbar
 ]]
map('n', '<F2>', ':TagbarToggle<CR>', opts)

--[[
LSP
 ]]
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

--[[
MarkdownPreview
 ]]
map('n', '<C-w>m', ':MarkdownPreviewToggle<cr>', opts)

--[[
Highlight colors
 ]]
map('n', '<C-c>', ':HighlightColorsToggle<cr>', opts)

--[[
nvim-dap
 ]]
map('n', '<F5>', '<cmd>:lua require("dap").continue()<cr>', opts)
map('n', '<F3>', '<cmd>:lua require("dap").terminate()<cr>', opts)
map('n', '<F9>', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts)
map('n', '<F10>', '<cmd>:lua require("dap").step_over()<cr>', opts)
map('n', '<F11>', '<cmd>:lua require("dap").step_into()<cr>', opts)
map('n', '<F12>', '<cmd>:lua require("dap").step_out()<cr>', opts)
