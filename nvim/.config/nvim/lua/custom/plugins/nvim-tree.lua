return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {}
  end,
  keys = {
    { '\\', ':NvimTreeOpen<CR>', { desc = 'NeoTree reveal' } },
    { '\\\\', ':NvimTreeToggle<CR>', { desc = 'NeoTree reveal' } },
  },
}
