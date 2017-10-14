execute pathogen#infect()

filetype plugin indent on

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

syntax enable
colorscheme base

set relativenumber
set number

set ignorecase
" Always display the status bar (makes vim-airline work)
set laststatus=2

let mapleader=","

set linebreak

" Sets scrollwheel to scroll the screen, not move the cursor
set mouse=a

" Setting keybindings for pasting to linux clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

let g:latex_preview#rebuild_events = 'TextChanged,TextChangedI'

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

