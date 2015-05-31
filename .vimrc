
"""""""""""""""""""""""""""
"  TEMP ANGULAR TRANSLATE "
"""""""""""""""""""""""""""

nnoremap ta ci"{{'' \| translate}}<esc>F'i
nnoremap tt dithi translate<esc>f<i


"""""""""""""""""
"  To Remember  "
"""""""""""""""""
"
" Normal:
" <c+w><c+]>  open ctags in split
" gi          go to last position of insert mode
" q:          open last command window, enter to run
"
" Insert:
" <c-j>       enter
" <c-h>       backspace
" <c-u>       delete whole line
" <c-r>       access register. <c-r>/ to put search
" <c-x><c-l>  line completion
" <c-o>       run single normal mode command
"
" OSX:
" <c-a>       jump to beginning of line
" <c-e>       jump to end of line
" <c-b>       move left one character
" <c-f>       move right one character
" <c-n>       move down one line
" <c-p>       move up one line
" <c-k>       delete remainder of current paragraph
" <c-y>       paste text from <c-k>
" <c-h>       backspace
" <c-v>       page down


"""""""""""""""""
"  Main Config  "
"""""""""""""""""

" no vi
set nocompatible

" Pathogen
execute pathogen#infect()

" Map leader key to comma
let mapleader = ","

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" system clipboard
" set clipboard=unnamed

" No splash screen
set shortmess+=I

" Filetype stuff
filetype on
filetype plugin on
filetype indent on

" Tabstops are 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

" override them anyway
autocmd FileType css  setlocal softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType html setlocal softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType php  setlocal softtabstop=2 shiftwidth=2 tabstop=2

" Custom syntaxes
autocmd BufRead,BufNewFile *.md       set filetype=markdown
autocmd BufRead,BufNewFile *.conf     set filetype=ini
autocmd BufRead,BufNewFile nginx.conf set filetype=nginx

" Disable left scrollbar
set guioptions-=L

" Remove toolbar
set guioptions-=T

" No wordwrap by default
set nowrap

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

" Show tab bar
set showtabline=2

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

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

" Set relative numbering
" set relativenumber
set number

" Incrementally match the search
set incsearch

" Automatically read a file that has changed on disk
set autoread

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=500

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
autocmd BufWrite * :%s/\r//ge

" Remove Byte Order Mark bullshit
autocmd BufWrite * set nobomb


"""""""""""""
"  Plugins  "
"""""""""""""

" Tabular
vmap <leader>t= :Tabularize /=<cr>
vmap <leader>t> :Tabularize /=><cr>

" CTRL-P
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.tmp|tmp|\.sass-cache|dist|bower_components|node_modules)$'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" NERDTree
map <leader>v :NERDTreeToggle<cr>

" Ctags
map <leader>ct :!/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=tmp *<cr>
set tags=./tags

" Ack
set grepprg=ack
map <c-n> :cn<cr>
map <c-p> :cp<cr>

" Ultisnips
let g:UltiSnipsSnippetDirectories = ["snippets"]
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
nmap <silent> <leader>es :UltiSnipsEdit<cr>

" Git Gutter
nmap <silent> <leader>gg :GitGutterToggle<cr>

" Powerline Statusline
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

" DelimitMate
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1


""""""""""""""""""""""""""""""""
"  Language Specific Bindings  "                           
""""""""""""""""""""""""""""""""

" HTML
map <leader>b <s-s>tstrong>
map <leader>e <s-s>tem>
map <leader>p <esc>^i<p><esc>$a</p><esc>^
map <leader>a <s-s>ta href="#">f#xi
nnoremap <leader>a f>
map <leader>g <s-s>"i<?= __(<esc>lx/"<cr>:nohls<cr>a); ?><esc>

" Haml
map <leader>ch 0<c-v>lr/<cr>

" Rails
inoremap <D-lt> <%=  %><esc>hhi
inoremap <D->> <%  %><esc>hhi

" CSS
nmap <leader>i =i{
inoremap <D-S-CR> <esc>:/}<cr>o<cr><esc>:nohls<cr>cc


"""""""""""""""""""""
"  Custom Bindings  "
"""""""""""""""""""""

map <leader>rn :call RenameFile()<cr>
map <leader>rf :call RunCurrentTest()<cr>
map <leader>rl :call RunCurrentLineInTest()<cr>
map <leader>2  :set shiftwidth=2<cr>
map <leader>4  :set shiftwidth=4<cr>

" Better splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Line break in normal mode
nnoremap <NL> i<CR><ESC>

" insert line below without entering insert mode
map <CR> o<esc>

" Command + Enter doesnt disturb current line
inoremap <D-CR> <esc>o

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

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Underline the current line with '='
nmap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>


"""""""""""""""
"  Functions  "
"""""""""""""""

function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!zeus rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end
  exec "!zeus rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

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
if exists("&transparency")
  :set transparency=3
  :set background=dark
  :colorscheme base16-tomorrow
endif

set guifont=Anonymous\ Pro:h14

" Returns syntax highlighting group that the current word under the cursor belongs to
" Useful for custom syntax highlighting
nmap <silent> <leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
