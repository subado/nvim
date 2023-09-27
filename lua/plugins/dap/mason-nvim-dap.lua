local daps = require 'plugins.dap.daps'
local to_package = require('mason-nvim-dap.mappings.source').nvim_dap_to_package
local get_not_installed = require('plugins.mason.utils').get_not_installed
local ensure_installed = get_not_installed(daps, to_package)

require('mason-nvim-dap').setup {
  ensure_installed = ensure_installed,
  automatic_installation = false,
}
