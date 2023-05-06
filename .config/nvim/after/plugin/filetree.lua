
require'nvim-web-devicons'.setup {}

-- TODO
require("nvim-tree").setup {
    renderer = {

        indent_markers = {
            enable = true
        },

        icons = {
        },
    },
}

vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFile)
