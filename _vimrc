set nocompatible
 
call plug#begin('~/.vimplugged')
 
Plug 'aklt/vim-substitute'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-dispatch', { 'tag' : 'v1.1' }
Plug 'vim-scripts/argtextobj.vim'
Plug 'tomtom/tcomment_vim'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'rdolgushin/groovy.vim'
Plug 'majutsushi/tagbar'
Plug 'jlfwong/vim-mercenary'
Plug 'vim-scripts/YankRing.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'rust-lang/rust.vim'
 
call plug#end()
 
filetype plugin indent on
 
" mustang ftw!
color mustang
 
" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
 
" search settings
set ignorecase
set smartcase " do not ignore case when query is mixed case
set incsearch
set showmatch
set hlsearch " highlight search
map N Nzz " move search result to mid screen
map n nzz
 
" tab navigation
set showtabline=2 " always show tab line
map <C-t> :tabnew<CR>
map <tab> :tabnext<CR>
map <S-tab> :tabprevious<CR>
map <C-w> :tabclose<CR>
imap jj <Esc>
map <F5> <ESC>:w<CR>:make!<CR>
" line wraps
set wrap
set textwidth=0
" autoindent
set autoindent
set pastetoggle=<F8>
" save when focus is lost
au FocusLost * :wa
set encoding=utf8
set fileencodings=utf8
syntax on
set laststatus=2 " always show status line
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ \ [%l,%v][%p%%]
set number " show line number
set scrolljump=1 " 1 line scrolls
set scrolloff=3 " start scrolling with 3 lines remaining on screen
set visualbell
set cursorline " show cursor line
hi CursorLine   term=NONE cterm=NONE
set ttyfast "
set ruler " show cursor location
set backspace=indent,eol,start " fix backspace
set mouse=a " use mouse
set showmode "
set showcmd "
set hidden "
set wildmenu " autocomplete
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,] "
set lazyredraw " do not redraw while running macros
set history=1000 "
set undolevels=1000 "
 
let mapleader = "\\"
 
set foldmethod=syntax
set foldlevel=999 " do not fold at first
 
" keyboard maps
" ===========
 
nnoremap j gj
nnoremap k gk
" type ; instead of :
nnoremap ; :
" copy to EOL
nnoremap Y y$
" shift in visual mode
vnoremap < <gv
vnoremap > >gv
" copy and paste to/from system clipboard!
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>
imap <C-v> <Esc><C-v>a
 
" autocmds
" ========
autocmd FileType c,cpp,js set expandtab ts=2 sw=2 sts=2
au! BufNewFile,BufRead *.csv setf csv
au! BufNewFile,BufRead *.dreport set ft=groovy ts=2 sw=2 et sts=2
au! BufNewFile,BufRead *.gm set ft=groovy
if !filereadable("Makefile") && !filereadable("makefile")
  set makeprg=echo\ 'g++\ -g\ --std=c++11\ \ %';g++\ -g\ --std=c++11\ %
endif
 
" leader commands
" =============
 
" reindent whole file
nmap <silent> <leader><tab> mzgg=G`z
" get rid of search highlights
nmap <silent> <leader><space> :nohlsearch<cr>
" get rid of trailing spaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" source this vimrc
nnoremap <leader>sv :so $MYVIMRC<CR>
" select last pasted
nnoremap <leader>v V`]
" vertical split
nnoremap <leader>w <C-w>v<C-w>l
" horizontal split
nnoremap <leader>e <C-w>s<C-w>j
" close split
nnoremap <leader>q <C-w>q
" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-l> <C-w>l
nnoremap <leader>= <C-w>=
 
" open in current directory..
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
 
" plugin commands
" =================
 
" Tagbar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin='~/bin/run-ctags'
" FZF
if executable("ag")
                let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
endif
"set wildignore=*.pyc,*.o,*.out,*.png
nnoremap <leader>t :FZF<CR>
 
" Ag
let g:ag_prg="ag --vimgrep"
nnoremap <leader>a :Ag
nnoremap <leader>A :Ag <C-R><C-W><CR>
 
" Yankring
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
let g:yankring_history_dir='~/.vim'
 
" Airline
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 1
 
" bufexplorer
map <leader>o :BufExplorer<CR>
 
nnoremap <F2> :call ToggleMouse()<CR>
nnoremap <F3> :set wrap!<CR>
function! ToggleMouse()
  if &mouse == 'a'
                set nonu
    set mouse=
    echo "Mouse usage disabled"
  else
                set nu
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction
 
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
 
 
" C-q to quit vim
silent !stty -ixon > /dev/null 2> /dev/null
nnoremap <C-q> :qa<CR>
 
" Make sure tile is updated
autocmd BufEnter * let &titlestring = hostname() . ":" . expand("%")
set title
