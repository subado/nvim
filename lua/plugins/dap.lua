local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/home/linuxbrew/.linuxbrew/bin/lldb-vscode', -- adjust as needed
	name = "lldb"
}

local dap = require('dap')
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},

		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--		echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--		Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html

		runInTerminal = false,

		-- 💀
		-- If you use `runInTerminal = true` and resize the terminal window,
		-- lldb-vscode will receive a `SIGWINCH` signal which can cause problems
		-- To avoid that uncomment the following option
		-- See https://github.com/mfussenegger/nvim-dap/issues/236#issuecomment-1066306073
		postRunCommands = {'process handle -p true -s false -n false SIGWINCH'}
	},
}

local map = require('maps').map
local opts = { noremap = true, silent = true }

map('n', '<F5>', '<cmd>:lua require("dap").continue()<cr>', opts)
map('n', '<F3>', '<cmd>:lua require("dap").terminate()<cr>', opts)
map('n', '<F9>', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts)
map('n', '<F10>', '<cmd>:lua require("dap").step_over()<cr>', opts)
map('n', '<F11>', '<cmd>:lua require("dap").step_into()<cr>', opts)
map('n', '<F12>', '<cmd>:lua require("dap").step_out()<cr>', opts)
