
"""""""""""""""""
"  To Remember  "
"""""""""""""""""
" 
" gi        go to last position of insert mode
" <ctrl+o>  move out a level
" <ctrl+i>  move in a level


"""""""""""""""""
"  Main Config  "
"""""""""""""""""

" no vi
set nocompatible     

" Get pathogen up and running
call pathogen#infect()

" Map leader key to comma
let mapleader = ","

" Filetype stuff
filetype on
filetype plugin on
filetype indent on

" Better splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Special Syntaxes
autocmd FileType ruby  setlocal softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType scss  setlocal softtabstop=4 shiftwidth=4 tabstop=4
autocmd FileType nginx setlocal softtabstop=4 shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.conf     set filetype=ini
autocmd BufRead,BufNewFile nginx.conf set filetype=nginx

" Search stuff
set wrapscan
set ignorecase

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions-=T

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hls

" Incrementally match the search
set incsearch

" Automatically read a file that has changed on disk
set autoread

" Line numbering
set nu

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn


""""""""""""""""""
"  Autocommands  "
""""""""""""""""""

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Remove windows bullshit
autocmd BufWrite * set ff=unix

" Remove Byte Order Mark bullshit
autocmd BufWrite * set nobomb


"""""""""""""
"  Plugins  "
"""""""""""""

" Ctags
map <leader>ct :!/usr/local/bin/ctags -R --exclude=.git --exclude=log *<CR>
set tags=./tags

" Ack
set grepprg=ack
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Ultisnips
let g:UltiSnipsSnippetDirectories = [ "snippets" ]
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
nmap <silent> <leader>es :UltiSnipsEdit<CR>

" Git Gutter
nmap <silent> <leader>gd :GitGutterToggle<CR>
nmap <silent> <leader>gh :GitGutterLineHighlightsToggle<CR>

" Powerline Statusline
set encoding=utf-8  
let g:Powerline_symbols = 'fancy'

" Autoclose
let AutoCloseExpandEnterOn = '{'


""""""""""""""""""""""""""""""""
"  Language Specific Bindings  "
""""""""""""""""""""""""""""""""

" HTML
map <leader>b <s-s>tstrong>
map <leader>e <s-s>tem>
map <leader>p <s-v><s-s>tp><s-j>x<s-j>x0
map <leader>a <s-s>ta href="#">f#xi
nnoremap <leader>a f>

" Haml                                
map <leader>ch 0<c-v>lr/<cr>
                                
" Rails
inoremap <D-lt> <%=  %><esc>hhi
inoremap <D->> <%  %><esc>hhi
imap <c-l> <space>=><space>

" CSS
nmap <leader>i =i{
inoremap <D-S-CR> <esc>:/}<cr>o<cr><esc>:nohls<cr>cc


"""""""""""""""""""""
"  Custom Bindings  "
"""""""""""""""""""""

" insert line below without entering insert mode
map <CR> o<Esc>

" Command + Enter doesnt disturb current line
inoremap <D-CR> <C-O>o 

" File Movement
map j gj
map k gk

" Indenting in insert
inoremap <D-]> <esc>>>i
inoremap <D-[> <esc><<i

" Easy match bracket pairs
nnoremap <tab> %
vnoremap <tab> %  

" Disable highlight search
nmap <silent> <leader>n :nohls<CR>

" set text wrapping toggles
nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>

" Delete empty lines
nmap <leader>del :g/^$/d<cr>

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Underline the current line with '='
nmap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>

" Multipurpose Tab Key
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>rn :call RenameFile()<cr>

" :Bda to delete all open buffers
command! -nargs=0 -bang Bda
    \ :call BufDeleteAll('<bang>')
function! BufDeleteAll(bang)
    let last_buffer = bufnr('$')
    let n = 1
    while n <= last_buffer
        if a:bang == '' && getbufvar(n, '&modified')
            echohl ErrorMsg
            echomsg 'No write since last change for buffer'
                        \ n '(add ! to override)'
            echohl None
            return 0
        endif
        let n = n+1
    endwhile
    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if buflisted(n)
            silent exe 'bdel' . a:bang . ' ' . n
            if ! buflisted(n)
                let delete_count = delete_count+1
            endif
        endif
        let n = n+1
    endwhile
    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif
endfunction


"""""""""""
"  Style  "
"""""""""""

" Set up the window colors and size
set transparency=3
set guifont=Anonymous\ Pro:h14
set background=dark
colorscheme hybrid

" Returns syntax highlighting group that the current word under the cursor belongs to
" Useful for custom syntax highlighting
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
