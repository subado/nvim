local dap = require('dap')

require('plugins.dap.mason-nvim-dap')

--[[
SIGNS CONFIGURATION
 ]]
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})

--[[
Languages configurations
 ]]
require('plugins.dap.configs.cpp')
-- Use cpp config for Rust and C
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('plugins.dap.configs.bash')

require('plugins.dap.configs.python')

require('plugins.dap.dapui')
