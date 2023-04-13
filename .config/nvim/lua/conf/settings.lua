---------- ================================== ----------
----------            Vim settings            ----------
----------            :help vim.o             ----------
---------- ================================== ----------

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Tabs and indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- I don't like wrapping
vim.opt.wrap = false

-- Undos and backups
-- TODO: set up undo history stuff
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Colors are good
vim.opt.termguicolors = true

-- Nice scrolling
vim.opt.scrolloff = 8

-- Enable the column for git signs and stuff
vim.opt.signcolumn = "yes"

-- Make it fast
vim.opt.updatetime = 50

-- Sometimes useful, always annoying
-- vim.opt.colorcolumn = "80"

-- Autocompletish
vim.opt.completeopt = 'menuone,noselect'

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
