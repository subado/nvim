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
map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
map('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
map('n', 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
map('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
map('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)

--[[
MarkdownPreview
]]
map('n', '<C-m>', ':MarkdownPreviewToggle<cr>', opts)
