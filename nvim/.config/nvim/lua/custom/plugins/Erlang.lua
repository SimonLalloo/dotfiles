return {

  -- LSP
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        erlangls = {
          capabilities = {
            documentFormattingProvider = false,
            documentRangeFormattingProvider = false,
          },
          init_options = {
            formatting = {
              -- Indentation settings
              indentWidth = 4,
              tabWidth = 4,
              insertSpaces = true,

              -- Alignment settings
              alignComments = false,
              alignFunctionClauses = false,
              alignGuards = false,
              alignTypes = false,

              -- Line breaking settings
              breakIndentOperands = true,
              breakIndentGuards = true,
              breakIndentClauses = true,

              -- Spacing settings
              spaceAroundOperators = true,
              spaceBeforeOperators = true,
              spaceAfterOperators = true,

              -- General formatting
              preserveNewlines = true,
            },
          },
        },
      },
    },
  },
}
