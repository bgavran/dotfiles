execute pathogen#infect()

set number
set relativenumber

" Smart searching
set ignorecase
set smartcase

let mapleader=","

" Sets scrollwheel to scroll the screen, not move the cursor
set mouse=a

" Yank to system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

set background=dark
colorscheme solarized

let g:airline_theme='luna'

set cursorcolumn
set cursorline

" Update latex documents when they're changed
"let g:latex_preview#rebuild_events = 'TextChanged,TextChangedI'
