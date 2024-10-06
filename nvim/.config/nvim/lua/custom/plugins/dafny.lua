return {
  'mlr-msft/vim-loves-dafny',
  ft = 'dafny',
  config = function()
    vim.cmd [[
      autocmd BufRead,BufNewFile *.dfy set filetype=dafny
    ]]
  end,
}
