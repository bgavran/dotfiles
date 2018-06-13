execute pathogen#infect()

filetype plugin indent on

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

syntax enable

" Always display the status bar (makes vim-lightline work)
set laststatus=2

" lightline colorcheme
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

let g:solarized_use16=1
set background=dark
colorscheme solarized8_flat

set relativenumber
set number

set ignorecase
set smartcase

let mapleader=","

set linebreak

set autoindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Sets scrollwheel to scroll the screen, not move the cursor
set mouse=a

" Setting keybindings for pasting to linux clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

"=====[ Highlight matches when jumping to next ]=============

    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>


    " Just highlight the match in red...
    function! HLNext (blinktime)
        highlight WhiteOnRed ctermfg=white ctermbg=darkred
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#\%('.@/.'\)'
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()                       
                                                             
" Remove any introduced trailing whitespace after moving...  
let g:DVB_TrimWS = 1                                         

" Haskell syntax highlighting
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" indentLine indent character
let g:indentLine_char = '⎸'

" Set longer vim history size
if &history < 1000
  set history=10000
endif

" Latex preview, minted package requires this
let g:latex_preview#compiler_args = '-shell-escape'

let g:latex_preview#rebuild_events = 'TextChanged,TextChangedI'

" Haskell indentation
let g:haskell_indent_disable = 1
" let g:haskell_indent_if = 2
" let g:haskell_indent_case = 2
" let g:haskell_indent_let = 2
" let g:haskell_indent_where = 2
" let g:haskell_indent_before_where = 2
" let g:haskell_indent_after_bare_where = 2
" let g:haskell_indent_do = 2
" let g:haskell_indent_in = 2
" let g:haskell_indent_guard = 2

" Linting
let g:ale_set_quickfix = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Hightlight current position
set cursorline
set cursorcolumn 
hi CursorLine cterm=NONE ctermbg=0

" NERDTree - open a file in new tab by default 
let NERDTreeMapOpenInTab='<ENTER>'

" Keep cursor in the middle while scrolling
set scrolloff=10
