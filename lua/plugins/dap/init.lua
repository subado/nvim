local dap = require('dap')

require('plugins.dap.configs.cpp')
-- Use cpp config for Rust and C
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('plugins.dap.dapui')
