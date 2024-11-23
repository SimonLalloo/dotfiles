return {
  {
    'nvim-java/nvim-java',
    ft = 'java',
  },

  -- Add Java LSP
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        jdtls = {},
      },
    },
  },

  -- Testing & debugging
  -- NOTE: `:NeotestJava setup` must be run to complete install
  -- FIXME: This doesn't actually work. It can't find any tests.
  {
    'rcasia/neotest-java',
    ft = 'java',
    dependencies = {
      'mfussenegger/nvim-jdtls',
      'mfussenegger/nvim-dap', -- for the debugger
      'rcarriga/nvim-dap-ui', -- recommended
      'theHamsta/nvim-dap-virtual-text', -- recommended
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      adapters = {
        ['neotest-java'] = {
          -- config here
        },
      },
    },
  },
}
