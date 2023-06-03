-- Set leader
vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Leave insert mode in a reasonable way
vim.keymap.set('i', 'kj', '<Esc>', { silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })

-- Move highlighted code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Paste over highlighted code
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

