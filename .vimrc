"
"                               ____
"                ,---,        ,'  , `.
"        ,---.,`--.' |     ,-+-,.' _ |
"       /__./||   :  :  ,-+-. ;   , ||
"  ,---.;  ; |:   |  ' ,--.'|'   |  ;|
" /___/ \  | ||   :  ||   |  ,', |  ':
" \   ;  \ ' |'   '  ;|   | /  | |  ||
"  \   \  \: ||   |  |'   | :  | :  |,
"   ;   \  ' .'   :  ;;   . |  ; |--'
"    \   \   '|   |  '|   : |  | ,
"     \   `  ;'   :  ||   : '  |/
"      :   \ |;   |.' ;   | |`-'
"       '---" '---'   |   ;/
"                     '---'
"

""" VUNDLE

set rtp+=~/.vim/bundle/vim-vundle
call vundle#begin()

Plugin 'mileszs/ack.vim',                        {'name': 'vim-ack'}
Plugin 'vim-airline/vim-airline',                {'name': 'vim-airline'}
Plugin 'vim-airline/vim-airline-themes',         {'name': 'vim-airline-themes'}
Plugin 'slashmili/alchemist.vim',                {'name': 'vim-alchemist'}
Plugin 'hail2u/vim-css3-syntax',                 {'name': 'vim-css3-syntax'}
Plugin 'ctrlpvim/ctrlp.vim',                     {'name': 'vim-ctrlp'}
Plugin 'Raimondi/delimitMate',                   {'name': 'vim-delimitmate'}
Plugin 'junegunn/vim-easy-align',                {'name': 'vim-easy-align'}
Plugin 'elixir-editors/vim-elixir',              {'name': 'vim-elixir'}
Plugin 'airblade/vim-gitgutter',                 {'name': 'vim-gitgutter'}
Plugin 'fatih/vim-go',                           {'name': 'vim-go'}
Plugin 'othree/html5.vim',                       {'name': 'vim-html5'}
Plugin 'pangloss/vim-javascript',                {'name': 'vim-javascript'}
Plugin 'othree/javascript-libraries-syntax.vim', {'name': 'vim-javascript-libraries'}
Plugin 'tpope/vim-markdown',                     {'name': 'vim-markdown'}
Plugin 'scrooloose/nerdcommenter',               {'name': 'vim-nerd-commenter'}
Plugin 'scrooloose/nerdtree',                    {'name': 'vim-nerdtree'}
Plugin 'chr4/nginx.vim',                         {'name': 'vim-nginx'}
Plugin 'prettier/vim-prettier',                  {'name': 'vim-prettier'}
Plugin 'tpope/vim-rails',                        {'name': 'vim-rails'}
Plugin 'tpope/vim-repeat',                       {'name': 'vim-repeat'}
Plugin 'cakebaker/scss-syntax.vim',              {'name': 'vim-scss'}
Plugin 'justinmk/vim-sneak',                     {'name': 'vim-sneak'}
Plugin 'tpope/vim-surround',                     {'name': 'vim-surround'}
Plugin 'SirVer/ultisnips',                       {'name': 'vim-ultisnips'}
Plugin 'VundleVim/Vundle.vim',                   {'name': 'vim-vundle'}
Plugin 'maxbrunsfeld/vim-yankstack',             {'name': 'vim-yankstack'}

call vundle#end()


""" CORE

" filetype setup
filetype plugin indent on

" syntax highlighting
syntax on


""" VARIABLES

" leader key
let mapleader = ","


""" BUNDLE CONFIG

" vim-airline
set encoding=utf-8
let g:airline_powerline_fonts = 1

" vim-ctrlp
map <d-5> <f5>
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.tmp|\.sass-cache|_site|_build|bower_components|build|deps|dist|node_modules|Pods|priv|tmp)$'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path  = 0
let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>']}

" vim-delimitmate
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-gitgutter
set updatetime=250
nmap <silent> <leader>gg :GitGutterToggle<cr>

" vim-nerdtree
map <leader>v :NERDTreeToggle<cr>

" vim-ultisnips
nmap <silent> <leader>es :UltiSnipsEdit<cr>
let g:UltiSnipsSnippetDirectories = ["ultisnips"]
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"


""" OPTIONS

" no vi
set nocompatible

" gui options
set guioptions-=L " disable left scrollbar
set guioptions-=T " remove toolbar

" don't line/column highlighting (slow)
set nocursorline
set nocursorcolumn

" code folding
set foldmethod=indent
set nofoldenable

" commands which open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" no splash screen
set shortmess+=I

" disable wordwrap
set nowrap

" better join
set formatoptions+=j

" search
set wrapscan

" ignore case while searching
set ignorecase

" search highlighting
set hls

" search as you type
set incsearch

" command line height
set ch=2

" no visual bell
set vb

" allow backspacing over indent, eol, and start of insert
set backspace=2

" always show status line, even if only one window
set laststatus=2

" don't update display while executing macros
set lazyredraw

" show current mode
set showmode

" show commands while typing
set showcmd

" show buffer tabs
set showtabline=2

" hide mouse while typing
set mousehide

" set gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" allow cursor to go anywhere
set virtualedit=all

" macro wait time
set timeoutlen=500

" history length
set history=1000

" scroll when 8 lines away from edge
set scrolloff=8

" for command-line completion
set wildmenu

" no characters in separators
set fillchars = ""

" ignore whitespace in diff
set diffopt+=iwhite

" fixed line numbers
set number

" automatically read file after changes on disk
set autoread

" syntax highlighting max
set synmaxcol=500

" ctags
set tags=./tags

" ack
set grepprg=ack

" tab config
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" text wrapping
set textwidth=80


""" AUTO COMMANDS

" override tab config
autocmd FileType sh setlocal softtabstop=4 shiftwidth=4 tabstop=4

" filetype
autocmd BufRead,BufNewFile *.conf   set filetype=ini
autocmd BufRead,BufNewFile *.css    set filetype=scss " postCSS doesn't require .scss extension
autocmd BufRead,BufNewFile *.gradle set filetype=java " because groovy highlighting is stupid

" remember last location in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" remove windows bullshit
autocmd BufWrite * set ff=unix
autocmd BufWrite * :%s/\r//ge

" remove byte order mark bullshit
autocmd BufWrite * set nobomb

" function: strip trailing whitespace on save
autocmd BufWritePre * :call <sid>StripTrailingWhitespaces()


""" MAPPINGS

" html
map <leader>b <s-s>tstrong>
map <leader>e <s-s>tem>
map <leader>p <esc>^i<p><esc>$a</p><esc>^
map <leader>a <s-s>ta href="#">f#xi

" rails
inoremap <d-lt> <%=  %><esc>hhi
inoremap <d->> <%  %><esc>hhi

" css
nmap <leader>i =i{ " format inner {}
inoremap <d-s-cr> <esc>:/}<cr>o<cr><esc>:nohls<cr>cc

" .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" better up and down
map j gj
map k gk

" better splits
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" better horizontal scrolling
nmap <silent> <c-o> 10zl
nmap <silent> <c-i> 10zh

" return without disturbing line in insert mode
inoremap <d-cr> <esc>o

" return from normal mode
map <cr> o<esc>

" toggle word wrap
nmap <silent> <leader>ww :set invwrap<cr>:set wrap?<cr>

" indenting from insert mode
inoremap <D-]> <esc>>>i
inoremap <D-[> <esc><<i

" clear highlight search
nmap <silent> <leader>n :nohls<cr>

" delete empty lines
nmap <leader>del :g/^$/d<cr>

" ctags
map <leader>ct :!/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=tmp *<cr>

" show syntax highlighting group under cursor (for theming)
nmap <silent> <leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" function: rename file
map <leader>rn :call RenameFile()<cr>


""" COMMANDS

" function: delete all open buffers with :Bda
command! -nargs=0 -bang Bda :call BufDeleteAll('<bang>')


""" FUNCTIONS

function! <sid>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

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


""" STYLE

if exists("&transparency")
  set transparency=3
  set background=dark

  colorscheme atom-dark "dracula
endif

set guifont=Anonymous\ Pro\ for\ Powerline:h14
