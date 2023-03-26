local cmd = vim.cmd

--[[ cmd[[
autocmd FileType cpp,c,hpp,h setl noai nocin nosi inde=
]]
cmd([[
filetype indent plugin on
syntax enable
]])

-- Highlight yanked text for while 200ms
cmd([[
autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
]])

-- 2 spaces for selected filetypes
--cmd[[
--autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja,json setlocal shiftwidth=2 tabstop=2
--]]

-- don't auto commenting new lines
cmd([[
au BufEnter * set fo-=c fo-=r fo-=o
]])

-- gray
cmd([[
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
]])
-- blue
cmd([[
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
]])
-- light blue
cmd([[
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
]])
-- pink
cmd([[
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
]])
-- front
cmd([[
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])

cmd([[
set mouse=a
]])
cmd([[
au BufRead,BufNewFile *.tpp  set filetype=cpp
]])
