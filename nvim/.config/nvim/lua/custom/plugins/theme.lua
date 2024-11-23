return {
  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
  },

  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.g.gruvbox_material_foreground = 'material'
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_transparent_background = 0
  --     vim.cmd.colorscheme 'gruvbox-material'
  --   end,
  -- },
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_style = 'atlantis'
      vim.g.sonokai_better_performance = 1
      vim.cmd.colorscheme 'sonokai'
    end,
  },

  -- Colorizer shows the colors of thins like #ff0000
  {
    'norcalli/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('colorizer').setup({
        '*', -- All file types
      }, {
        -- Options go here
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = 'background', -- Set the display mode
      })
    end,
  },
}
