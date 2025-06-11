return {
  -- Add LSP
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        clangd = {},
      },
    },
  },
}
