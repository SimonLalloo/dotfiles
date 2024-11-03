return {
  {
    'mlr-msft/vim-loves-dafny',
    ft = 'dafny',
    config = function()
      local lspconfig = require 'lspconfig'
      vim.cmd [[
        autocmd BufRead,BufNewFile *.dfy set filetype=dafny
      ]]
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        dafny = {
          cmd = { 'dafny', 'server' },
          filetypes = { 'dafny' },
          root_dir = function()
            return require('lspconfig').util.root_pattern '*.dfy'()
          end,
          settings = {
            dafny = {
              -- Add any Dafny-specific settings here
            },
          },
        },
      },
    },
  }
}
