local M = {}
	
M.settings = {
	pylsp = {
		plugins = {
			pycodestyle = {
				ignore = { 'W391' }
			}
		}
	}
}

return M
