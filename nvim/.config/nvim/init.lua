---------- ================================== ----------
----------             Set leader            ----------
---------- ================================== ----------
-- This has to happen first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if your terminal supports true color
vim.opt.termguicolors = true

---------- ================================== ----------
----------       Install package manager      ----------
---------- ================================== ----------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

---------- ================================== ----------
----------               Plugins!             ----------
---------- ================================== ----------
require('lazy').setup({ import = 'custom/plugins' }, {})
