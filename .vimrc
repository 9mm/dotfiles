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

""" PLUG

call plug#begin('~/.vim/bundle')

Plug 'mileszs/ack.vim',                        {'as': 'vim-ack'}
Plug 'vim-airline/vim-airline',                {'as': 'vim-airline'}
" Plug 'slashmili/alchemist.vim',                {'as': 'vim-alchemist'}
Plug 'dense-analysis/ale',                     {'as': 'vim-ale'}
Plug 'ap/vim-css-color',                       {'as': 'vim-css-color'}
Plug 'hail2u/vim-css3-syntax',                 {'as': 'vim-css3-syntax'}
" Plug 'ctrlpvim/ctrlp.vim',                     {'as': 'vim-ctrlp'}
Plug 'Raimondi/delimitMate',                   {'as': 'vim-delimitmate'}
Plug 'junegunn/vim-easy-align',                {'as': 'vim-easy-align'}
Plug 'editorconfig/editorconfig-vim',          {'as': 'vim-editorconfig'}
" Plug 'elixir-editors/vim-elixir',              {'as': 'vim-elixir'}
Plug 'tpope/vim-endwise',                      {'as': 'vim-endwise'}
Plug 'tpope/vim-fugitive',                     {'as': 'vim-fugitive'}
Plug 'junegunn/fzf',                           {'as': 'vim-fzf'}
Plug 'junegunn/fzf.vim',                       {'as': 'vim-fzf-wrapper'}
Plug 'airblade/vim-gitgutter',                 {'as': 'vim-gitgutter'}
" Plug 'fatih/vim-go',                           {'as': 'vim-go'}
Plug 'junegunn/goyo.vim',                      {'as': 'vim-goyo'}
Plug 'othree/html5.vim',                       {'as': 'vim-html5'}
Plug 'pangloss/vim-javascript',                {'as': 'vim-javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'as': 'vim-javascript-libraries'}
Plug 'tpope/vim-markdown',                     {'as': 'vim-markdown'}
Plug 'tmhedberg/matchit',                      {'as': 'vim-matchit'}
Plug 'scrooloose/nerdcommenter',               {'as': 'vim-nerd-commenter'}
Plug 'scrooloose/nerdtree',                    {'as': 'vim-nerdtree'}
" Plug 'chr4/nginx.vim',                         {'as': 'vim-nginx'}
Plug 'tyru/open-browser.vim',                  {'as': 'vim-open-browser'}
" Plug 'sheerun/vim-polyglot',                   {'as': 'vim-polyglot'}
Plug 'lifepillar/pgsql.vim',                   {'as': 'vim-postgres'}
Plug 'tpope/vim-rails',                        {'as': 'vim-rails'}
Plug 'tpope/vim-repeat',                       {'as': 'vim-repeat'}
Plug 'cakebaker/scss-syntax.vim',              {'as': 'vim-scss'}
" Plug 'justinmk/vim-sneak',                     {'as': 'vim-sneak'}
Plug 'tpope/vim-surround',                     {'as': 'vim-surround'}
Plug 'dhruvasagar/vim-table-mode',             {'as': 'vim-table'}
Plug 'gcmt/taboo.vim',                         {'as': 'vim-taboo'}
Plug 'gasparch/tagbar',                        {'as': 'vim-tagbar'}
" https://stackoverflow.com/a/20165747/794481
Plug 'kana/vim-textobj-line',                  {'as': 'vim-textobj-line'},
Plug 'kana/vim-textobj-user',                  {'as': 'vim-textobj-user'},
Plug 'SirVer/ultisnips',                       {'as': 'vim-ultisnips'}
Plug 'mbbill/undotree',                        {'as': 'vim-undo-tree'}
Plug 'posva/vim-vue',                          {'as': 'vim-vue'}
Plug 'maxbrunsfeld/vim-yankstack',             {'as': 'vim-yankstack'}

call plug#end()

""" CORE

" filetype setup
filetype plugin indent on

" syntax highlighting
syntax on


""" VARIABLES

" leader key
let mapleader = ','


""" FIX gx

if has('macunix')
  function! OpenURLUnderCursor()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = shellescape(s:uri, 1)
    if s:uri != ''
      silent exec "!open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<cr>
endif


""" BUNDLE CONFIG

" vim-ale
let g:airline#extensions#ale#enabled = 1
let g:ale_virtualtext_cursor = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'json': ['jsonlint'],
\  'vue': ['eslint'],
\}
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'json': ['jq'],
\  'vue': ['eslint'],
\}

" vim-ctrlp
" map <d-5> <f5>
" map <c-b> :CtrlPBuffer<cr>
" let g:ctrlp_custom_ignore = '\v[\/](\.git|\.tmp|\.sass-cache|_site|_build|build|deps|dist|node_modules|Pods|priv|storage|.tags|tmp)$'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path  = 0
" let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': [], 'AcceptSelection("t")': ['<cr>', '<c-m>']}

" vim-delimitmate
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-fzf
" https://github.com/junegunn/fzf/blob/master/README-VIM.md#examples
" https://github.com/junegunn/fzf.vim/issues/453
" Also see .zshrc for ignored files and folders
nmap <c-p> :FZF<cr>

" vim-gitgutter
set updatetime=250
nmap <silent> <leader>gg :GitGutterToggle<cr>

" vim-go
autocmd FileType go nmap <leader>b <plug>(go-build)
autocmd FileType go nmap <leader>r <plug>(go-run)
autocmd FileType go nmap <leader>i <plug>(go-info)
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
set updatetime=500

" vim-nerdtree
let g:NERDTreeSortOrder = ['\/$', '\.go$', '\.rb$', '*']
nnoremap <c-g> :NERDTreeToggle<cr>
let g:NERDTreeCascadeSingleChildDir = 0

" vim-open-browser
let g:netrw_nogx = 1 " disable netrw gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-postgres
let g:sql_type_default = 'pgsql'

" vim-taboo
let g:taboo_tab_format = '  %f%m  '

" vim-ultisnips
nmap <silent> <leader>es :UltiSnipsEdit<cr>
let g:UltiSnipsSnippetDirectories = ['ultisnips']
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'

" vim-yankstack
call yankstack#setup() " prevents conflict with vim-surround
if has('gui_running')
  set macmeta
endif


""" OPTIONS

" no vi
set nocompatible

" encoding
set encoding=utf-8
set fileencoding=utf-8

" gui options
set guioptions-=L " disable left scrollbar
set guioptions-=T " remove toolbar
set guioptions-=e " ugly tabs to fix this: https://github.com/macvim-dev/macvim/issues/1354

" don't line/column highlighting (slow)
set nocursorline
set nocursorcolumn

" fuck ex mode
noremap Q <Nop>

" code folding
set foldmethod=manual
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
set novb

" allow backspacing over indent, eol, and start of insert
set backspace=2

" always show status line, even if only one window
set laststatus=2

" don't update display while executing macros
set lazyredraw

" show as much of long lines as possible
:set display+=lastline

" og fonts
set macligatures

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

" scroll when x lines away from edge
set scrolloff=4

" for command-line completion
set wildmenu

" no characters in separators
set fillchars=""

" ignore whitespace in diff
set diffopt+=iwhite

" fixed line numbers
set number

" automatically read file after changes on disk
set autoread

" syntax highlighting max
set synmaxcol=500

" move lines
nnoremap <d-j> :m .+1<cr>==
nnoremap <d-k> :m .-2<cr>==
vnoremap <d-j> :m '>+1<cr>gv=gv
vnoremap <d-k> :m '<-2<cr>gv=gv

" ctags
set tags=./tags;,tags;./.tags;,.tags;

" ack
" set grepprg=ack
:set grepprg=grep\ --color=always\ -n\ $*\ /dev/null

" tab config
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" text wrap and disable autoformatting
" set textwidth=90
" set wrapmargin=0
" autocmd FileType * setlocal formatoptions-=t
" autocmd FileType * setlocal formatoptions-=c


""" AUTO COMMANDS

" override tab config
autocmd FileType sh setlocal softtabstop=4 shiftwidth=4 tabstop=4

" filetype
autocmd BufRead,BufNewFile *.conf     set filetype=ini
autocmd BufRead,BufNewFile *.css      set filetype=scss " postCSS doesn't require .scss extension
autocmd BufRead,BufNewFile *.pcss     set filetype=scss
autocmd BufRead,BufNewFile nginx.conf set filetype=nginx
autocmd BufRead,BufNewFile .tags      set filetype=tags

" remember last location in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" remove windows bullshit
autocmd BufWrite * set ff=unix
autocmd BufWrite * :%s/\r//ge

" remove byte order mark bullshit
autocmd BufWrite * set nobomb

" run current ruby script
autocmd BufRead, *.rb nmap <leader>r :silent !{ruby %}<cr>

" function: strip trailing whitespace on save
autocmd BufWritePre * :call <sid>StripTrailingWhitespaces()


""" MAPPINGS

" VimR

if has("gui_vimr")
  nnoremap <silent><D-S-{> gT
  nnoremap <silent><D-S-}> gt
endif

" html
map <leader>b <s-s>tstrong>
map <leader>e <s-s>tem>
map <leader>p <esc>^i<p><esc>$a</p><esc>^
map <leader>a <s-s>ta href="#">f#xi

" ruby
map <leader>chs :ChangeHashSyntax<cr>
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

" return in normal mode
map <cr> o<esc>

" unjoin in normal mode
nnoremap <nl> i<cr><esc>

" toggle word wrap
nmap <silent> <leader>ww :set invwrap<cr>:set wrap?<cr>

" indenting from insert mode
inoremap <D-]> <esc>>>i
inoremap <D-[> <esc><<i

" move lines up and down
nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==
inoremap <a-j> <esc>:m .+1<cr>==gi
inoremap <a-k> <esc>:m .-2<cr>==gi
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

" clear highlight search
nmap <silent> <leader>n :nohls<cr>

" delete empty lines
nmap <leader>del :g/^$/d<cr>

" ctags
map <leader>ct :silent !{ctags -R -f .tags --extra=+q --exclude=@"$HOME/.ctagsignore" *}<cr>

" tagbar
nmap <leader>tb :TagbarToggle<cr>

" show syntax highlighting group under cursor (for theming)
nmap <silent> <leader>qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" function: rename file
map <leader>rn :call RenameFile()<cr>


""" COMMANDS

" run mix format on current file
command MixFormat silent !{mix format %}

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
    echomsg delete_count 'buffer deleted'
  elseif delete_count > 1
    echomsg delete_count 'buffers deleted'
  endif
endfunction


""" STYLE

set background=dark

set guifont=Anonymous\ Pro\ for\ Powerline:h14
"set guifont=Iosevka:h15
set linespace=-2

" everything except terminal
if has('gui_running') || has('gui_vimr')
  colorscheme exuma
endif

" MacVim
if has('gui_running')
  let g:airline_powerline_fonts = 1

  " set window location to align nicely on start
  " 105 / 870 or 106 / 864
  " if guioptions-=e is off use 64
  execute('win 106 65')
  autocmd VimEnter * call timer_start(120, { tid -> execute('winpos 864 0')})
endif

if exists('&transparency')
  set transparency=3
endif

let g:airline_theme='redux'

" override ctrl-p
hi CursorLine cterm=none ctermbg=darkgray ctermfg=white guibg=#333333 guifg=white
