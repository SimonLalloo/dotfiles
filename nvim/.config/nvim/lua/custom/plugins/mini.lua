return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()

    -- Autopair brackets
    require('mini.pairs').setup()

    -- Comment lines
    require('mini.comment').setup()

    -- Visualize indent level
    require('mini.indentscope').setup()

    -- Startup splash
    require('mini.starter').setup()

    -- Simple and easy statusline.
    -- TODO: Replace this with better statusline
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
