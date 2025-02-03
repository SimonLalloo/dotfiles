-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--------------------------------------------------
-- Some Python-specific stuff
--------------------------------------------------
vim.api.nvim_create_user_command('RunPython', function()
  local filename = vim.fn.expand '%'
  vim.cmd('!python3 ' .. filename)
end, {})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.g.python_host_prog = '/home/simon/.python-neovim/python-neovim/bin/python'
    vim.g.python3_host_prog = '/home/simon/.python-neovim/python-neovim/bin/python'
    vim.keymap.set('n', '<leader>cp', '<cmd>RunPython<cr>', { desc = 'Run [P]ython' })
  end,
  group = vim.api.nvim_create_augroup('YourGroupName', { clear = true }),
})
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
