---------- ================================== ----------
----------         Install packer             ----------
---------- ================================== ----------
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

---------- ================================== ----------
----------          Use packages              ----------
---------- ================================== ----------
-- I think this may break if not in this file
require('packer').startup(function(use)
    -- Package manager - packer manages itself
    -- (and can uninstall itself if not included here)
    use 'wbthomason/packer.nvim'

    -- ================= Theming =======================
    -- Enable themes in after/plugin/theme.lua

    -- FIXME: This one is broken
    -- use({
    --     "dharmx/nvim-colo",
    --     config = function()
    --         require("colo").setup()
    --     end,
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --     }
    -- })

    -- use { "catppuccin/nvim", as = "catppuccin" }

    use 'sainnhe/gruvbox-material'

    -- =================================================

    -- Telescope (find stuff)
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', 
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope-media-files.nvim' }

    -- Treesitter (AST for syntax highlighting and stuff)
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- Harpoon (file nav)
    use("theprimeagen/harpoon")

    -- Undo-tree
    use 'mbbill/undotree'

    -- Vim-fugitive (Git)
    use 'tpope/vim-fugitive'
    -- Git-signs
    use 'lewis6991/gitsigns.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Small things
    use 'norcalli/nvim-colorizer.lua'
    use 'numToStr/Comment.nvim'
    use "windwp/nvim-autopairs"

    -- File tree
    use 'nvim-tree/nvim-tree.lua'

    -- Icons
    use 'nvim-tree/nvim-web-devicons'

    -- LSP Zero (Language Server)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    -- LSP loading thing
    use 'j-hui/fidget.nvim'

    -- Other language stuff
    use 'simrat39/rust-tools.nvim'

    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
end)

---------- ================================== ----------
----------           Bootstrap thing          ----------
---------- Bootstrap requires restarting nvim ----------
---------- ================================== ----------
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

---------- ================================== ----------
----------    Re-source / recompile on save   ----------
---------- ================================== ----------
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

---------- ================================== ----------
----------           Main require             ----------
---------- ================================== ----------
require("conf")
