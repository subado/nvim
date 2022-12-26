local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require("luasnip")

-- nvim-cmp setup
cmp.setup {
	snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
	},
	mapping = {
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Tab>"] = cmp.mapping.select_prev_item(),
		["<S-Tab>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<C-Space>"] = cmp.mapping.confirm { select = true },
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			scrollbar = "║",
		},

		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			scrollbar = "║",
		},
	},
	formatting = {
		format = lspkind.cmp_format({
			menu = ({
				nvim_lsp = "[LSP]",
				path = "[Path]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				buffer = "[Buffer]",
			})
		})
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	sorting = {
			comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.recently_used,
					require("clangd_extensions.cmp_scores"),
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
			},
	},
}

cmp.setup.filetype({ 'markdown', 'help' }, {
	sources = {
		{ name = 'path' },
	},
	window = {
		documentation = cmp.config.disable
	}
})
