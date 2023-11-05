require('nvim-treesitter.configs').setup {
  ensure_installed = { 'cpp', 'python', 'lua', 'bash', 'javascript', 'tsx', 'typescript', 'doxygen' }, -- Only use parsers that are maintained

  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'cpp', 'c' },
  },
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
