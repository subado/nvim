local dap = require('dap')

require('plugins.dap.mason-nvim-dap')

--[[
SIGNS CONFIGURATION
 ]]
vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➡️', texthl = '', linehl = '', numhl = '' })

--[[
Languages configurations
 ]]

local daps = require 'plugins.dap.daps'
for _, adapter in ipairs(daps) do
  pcall(require, 'plugins.dap.configs.' .. adapter)
end

-- Use cpp config for Rust and C
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


require('plugins.dap.dapui')
