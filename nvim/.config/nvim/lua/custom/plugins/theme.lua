--   'folke/tokyonight.nvim',
--   priority = 1000,
--   init = function()
--     vim.cmd.colorscheme 'tokyonight-night'
--
--     -- You can configure highlights by doing something like:
--     vim.cmd.hi 'Comment gui=none'
--   end,
-- },
return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_foreground = 'material'
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_transparent_background = 0
    vim.cmd.colorscheme 'gruvbox-material'
  end,
}
