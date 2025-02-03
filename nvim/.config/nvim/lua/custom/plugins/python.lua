return {
  {
    'linux-cultist/venv-selector.nvim',
    branch = 'regexp', -- This is the regexp branch, use this for the new version
    config = function()
      require('venv-selector').setup()
    end,
    keys = {
      { '<leader>cv', '<cmd>VenvSelect<cr>', desc = 'Select VirtualEnv' },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        pyright = {}, -- Type checker
        ruff = {}, -- LSP
      },
      setup = {
        ruff = function()
          require('lazyvim.util').lsp.on_attach(function(client, _)
            if client.name == 'ruff_lsp' then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },

  -- To make it work properly, the path for the python environment
  -- for Nvim needs to be set in the python autocommand in the
  -- following file:
  -- ~/plugin/autocommands.lua
}
