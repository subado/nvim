local cmd = vim.cmd		-- execute Vim commands
local exec = vim.api.nvim_exec	-- execute Vimscript
local g = vim.g			-- global variables
local opt = vim.opt		-- global/buffer/windows-scoped options
-- [[
-- Main
-- ]]


local pywal = require('pywal')
pywal.setup()

vim.diagnostic.config {
	virtual_text = false,
	underline = true, -- Keep error underline
	signs = true, -- Keep gutter signs
}
