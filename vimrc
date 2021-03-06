filetype plugin indent on
syntax on
colo slate

cd ~/Projects

set number                        " show line numbers
set wildignore+=**/node_modules   " ignores node_modules
set wildignore+=**/spec/reports   " ignores spec/reports
set wildignore+=**/tmp/cache      " ignores tmp/cache
set wildignore+=*.pyc             " ignores *.pyc
set ruler                         " show current position
set showmode                      " show what mode we're currently editing in
set showmatch                     " show matching brackets
set list                          " show hidden chars
set listchars=tab:▸\ ,eol:¬       " chars to be shown
set clipboard+=unnamed            " yanks to clipboard

set noswapfile                    " no sw?s
set visualbell                    " no beeps
set nospell                       " no spell checking
set wrap!                         " no word wrapping

set virtualedit=all               " allow the cursor to go in to 'invalid' places
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set iskeyword+=_,$,@,%,#          " none of these are word dividers
set ttimeoutlen=50                " make esc key faster
set scrolloff=3                   " number of lines to keep off the edges of the screen when scrolling
set textwidth=0                   " no limit for text column width

set autoindent                    " always set autoindenting on
set copyindent                    " copy indentation on new lines
set smartindent                   " indent on new blocks

set expandtab                     " expand tabs by default (overloadable per file type later)
set smarttab                      " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=2                     " tab spaces size
set softtabstop=2                 " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=2                  " number of spaces to use for autoindenting
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'

set noignorecase                  " do not ignore case when searching
set nogdefault                    " do not search/replace 'globally' (on a line) by default
set smartcase                     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch                      " highlight search terms
set incsearch                     " show search matches as you type
set wildmenu                      " show list instead of just completing
set wildmode=list:longest,full    " command <Tab> completion, list matches, then longest common part, then all

"change working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

"quicker access to commands
nnoremap ; :

"escape key cleans search highlights
nnoremap <CR> :noh<CR>:<CR>

"format json (leader + j)
nmap <silent> <Leader>j :%!python -m json.tool<CR>

"close all open buffers
nmap <silent> <Leader>x :bd *<C-a><CR>

"tabs navigation (cmd + shift + arrows)
nmap <D-S-Left> :tabprevious<CR>
nmap <D-S-Right> :tabnext<CR>

"splits navigation (cmd + alt + arrows)
nmap <silent> <D-A-Up> :wincmd k<CR>
nmap <silent> <D-A-Down> :wincmd j<CR>
nmap <silent> <D-A-Left> :wincmd h<CR>
nmap <silent> <D-A-Right> :wincmd l<CR>

"create empty split related to the current one (leader + arrows)
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>

"switch tab size between 2 and 4 spaces (leader + 2|4)
nmap <silent> <Leader>2 :set tabstop=2<CR>:set softtabstop=2<CR>:set shiftwidth=2<CR>
nmap <silent> <Leader>4 :set tabstop=4<CR>:set softtabstop=4<CR>:set shiftwidth=4<CR>

"center search results
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"move selected block up/down (shift + up|down)
vmap <S-up> xkP'[V']
vmap <S-down> xp'[V']

"move current line up/down (shift + up|down)
nmap <S-up> :call g:MoveLineUp()<CR>
nmap <S-down> :call g:MoveLineDown()<CR>

function! g:MoveLineUp()
  if &modifiable
    normal ddkP
  endif
endfunction

function! g:MoveLineDown()
  if &modifiable
    normal ddp
  endif
endfunction

"ignore F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
