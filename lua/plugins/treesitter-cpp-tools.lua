require('nvim-treesitter.configs').setup({
	nt_cpp_tools = {
		enable = true,
		preview = {
			quit = 'q', -- optional keymapping for quit preview
			accept = '<C-Space>' -- optional keymapping for accept preview
		},
		custom_define_class_function_commands = { -- optional
			TSCppImplWrite = {
				output_handle = require'nvim-treesitter.nt-cpp-tools.output_handlers'.get_add_to_cpp()
			}
			--[[
			<your impl function custom command name> = {
				output_handle = function (str, context) 
					-- string contains the class implementation
					-- do whatever you want to do with it
				end
			}
			]]
		}
	}
})