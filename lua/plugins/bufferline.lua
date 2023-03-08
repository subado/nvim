require('bufferline').setup {
  options = {
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = 'thin', -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    fill = {
      fg = { attribute = 'fg', highlight = '#ff0000' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    background = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    -- buffer_selected = {
    --   fg = {attribute='fg',highlight='#ff0000'},
    --   bg = {attribute='bg',highlight='#0000ff'},
    --   gui = 'none'
    --   },
    buffer_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    close_button = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    close_button_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    -- close_button_selected = {
    --   fg = {attribute='fg',highlight='TabLineSel'},
    --   bg ={attribute='bg',highlight='TabLineSel'}
    --   },

    tab_selected = {
      fg = { attribute = 'fg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    tab = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    tab_close = {
      -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
      fg = { attribute = 'fg', highlight = 'TabLineSel' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    duplicate_selected = {
      fg = { attribute = 'fg', highlight = 'TabLineSel' },
      bg = { attribute = 'bg', highlight = 'TabLineSel' },
      underline = true,
    },
    duplicate_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
      underline = true,
    },
    duplicate = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
      underline = true,
    },
    modified = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    modified_selected = {
      fg = { attribute = 'fg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    modified_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    separator = {
      fg = { attribute = 'bg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    separator_selected = {
      fg = { attribute = 'bg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    -- separator_visible = {
    --   fg = {attribute='bg',highlight='TabLine'},
    --   bg = {attribute='bg',highlight='TabLine'}
    --   },
    indicator_selected = {
      fg = { attribute = 'fg', highlight = 'LspDiagnosticsDefaultHint' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
  },
}
