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
map('n', '<Space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
map( "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
map("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
map('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)

--[[
MarkdownPreview
 ]]
map('n', '<C-w>m', ':MarkdownPreviewToggle<cr>', opts)

--[[
Highlight colors
 ]]
map('n', '<C-c>', ':HighlightColorsToggle<cr>', opts)
