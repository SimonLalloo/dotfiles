return {
  {
    'CervEdin/vim-minizinc',
    -- Lazy loading: only when opening minizinc files
    event = { 'BufReadPre *.mzn', 'BufNewFile *.mzn', 'BufReadPre *.dzn', 'BufNewFile *.dzn' },
  },
}
