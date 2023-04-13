local lsp = require('lsp-zero').preset({})

-- Keybindings
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }
})

-- Trigger if an lsp attaches to the buffer
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)

  -- TODO: learn these
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.bug.signature_help() end)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

