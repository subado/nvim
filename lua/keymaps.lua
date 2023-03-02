local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--[[
Simple maps
 ]]
keymap('n', '<leader>/', ':nohl<CR>', opts)
keymap('', '<leader>sf', [[:%s/\ \ \ \ /\t/g<CR>]], opts)
keymap('', '<leader>st', [[:%s/\ \ /\t/g<CR>]], opts)
keymap('v', '<Tab>', [[: ><CR>]], opts)
keymap('v', '<S-Tab>', [[: <<CR>]], opts)

--[[
Telescope
 ]]
keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)

--[[
Bufferline
 ]]
keymap('n', '<A-l>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<A-h>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<A-d>', ':BufferLinePickClose<CR>', opts)
keymap('n', '<A-p>', ':BufferLinePick <CR>', opts)
keymap('n', '<A-1>', ':BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<A-2>', ':BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<A-3>', ':BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<A-4>', ':BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<A-5>', ':BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<A-6>', ':BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<A-7>', ':BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<A-8>', ':BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<A-9>', ':BufferLineGoToBuffer 9<CR>', opts)

--[[
NvimTree
 ]]
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

--[[
Tagbar
 ]]
keymap('n', '<F2>', ':TagbarToggle<CR>', opts)

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
keymap('n', '<C-w>m', ':MarkdownPreviewToggle<cr>', opts)

--[[
Highlight colors
 ]]
keymap('n', '<C-c>', ':HighlightColorsToggle<cr>', opts)

--[[
nvim-dap
 ]]
keymap('n', '<F5>', '<cmd>:lua require("dap").continue()<cr>', opts)
keymap('n', '<F3>', '<cmd>:lua require("dap").terminate()<cr>', opts)
keymap('n', '<F9>', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts)
keymap('n', '<F10>', '<cmd>:lua require("dap").step_over()<cr>', opts)
keymap('n', '<F11>', '<cmd>:lua require("dap").step_into()<cr>', opts)
keymap('n', '<F12>', '<cmd>:lua require("dap").step_out()<cr>', opts)

--[[
LuaSnip
 ]]
-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
keymap("i", "<c-n>", '<cmd>:lua require("luasnip").change_choice(1)<cr>', opts)
keymap("i", "<c-p>", '<cmd>:lua require("luasnip").change_choice(-1)<cr>', opts)

--[[
treesitter-cpp-tools
]]
keymap('v', '<C-d>', '<cmd>:TSCppDefineClassFunc<cr>', opts)
keymap('n', '<C-d>', '<cmd>:TSCppDefineClassFunc<cr>', opts)
