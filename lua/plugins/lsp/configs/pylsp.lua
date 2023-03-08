local M = {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391', 'E501' },
        },
      },
    },
  },
}

return M
