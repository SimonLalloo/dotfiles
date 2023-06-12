local builtin = require('telescope.builtin')

require('telescope').setup {
  extensions = {
    fzf = { -- This section is actually handled by defaults
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    },
  }
}

-- require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
require('telescope').load_extension('media_files')



-- ===== Telescope keybindings =====

-- Find files
vim.keymap.set('n', '<leader>pf', function ()
    builtin.find_files(require('telescope.themes')
        .get_dropdown({ previewer=false }));
end)
vim.keymap.set('n', '<leader>pg', function ()
    builtin.git_files(require('telescope.themes')
        .get_dropdown({ previewer=false }));
end)

-- Find in files
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

-- LSP stuff
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})

