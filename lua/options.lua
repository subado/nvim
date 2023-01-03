local options = {
	termguicolors = true, -- h24-bit RGB colors
	tabstop = 4, -- 1 tab == 4 spaces
	shiftwidth = 4, -- 1 tab == 4 spaces
	cindent = true,
	cino = "g0:0b1",
	number = true, -- lines numeration
	relativenumber = true, -- number relative curent line number
	so=99, -- cursor always in center
	backup = false,	-- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	showmode = false,	-- we don't need to see things like -- INSERT -- anymore
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
