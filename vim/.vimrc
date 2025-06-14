" Enable line numbers
set number

" Enable mouse support
set mouse=a

" Enable smart search
set ignorecase
set smartcase

" Disable line wrapping
set nowrap

" Set scrolloff to keep cursor away from screen border
set scrolloff=5

" Highlight the current line
" set cursorline

" Additional helpful settings
set incsearch           " Show search matches as you type
set hlsearch            " Highlight search results
set autoindent          " Auto-indent new lines
set expandtab           " Use spaces instead of tabs
set shiftwidth=4        " When indenting with '>', use 4 spaces width
set tabstop=4           " Show existing tab with 4 spaces width
set softtabstop=4       " When hitting <BS>, pretend like a tab is removed, even if spaces
set ruler               " Show the cursor position all the time
set showcmd             " Display incomplete commands
set wildmenu            " Better command-line completion
set laststatus=2        " Always display the status line

" if has('clipboard')
    " Copy to clipboard in normal and visual mode
    nnoremap <leader>y "+y
    vnoremap <leader>y "+y
" else
"     echo "Clipboard support not available"
" endif

