-- The file for theme and theme settings
--
-- Unused themes should be commented out to save resources

----- Catppuccin -----
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
--
-- require("catppuccin").setup({
--     transparent_background = true,
-- })

----- Gruvbox -----
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = 'original'

----- Set theme -----
vim.cmd [[colorscheme gruvbox-material]]
