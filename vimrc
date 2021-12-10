let mapleader                               = "\<Space>"
let maplocalleader                          = ",,"
set lazyredraw
set timeout timeoutlen=1500
set pastetoggle=<F2>

map <leader><tab> gg=G<C-o><C-o>

nnoremap <leader>sv  :source ~/.vim/vimrc<CR>
nnoremap <leader>v <C-w><C-v>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>t :tabnew

set go+=a " Visual selection automatically copied to the clipboard
set clipboard=unnamed
set encoding=UTF-8
colorscheme slate
syntax on
set nocompatible
filetype plugin indent on
set backspace=indent,eol,start

" set global search replace
set gdefault

"standard indent
filetype indent   on

au BufWritePost *.ino silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
"PEP8 indent for python
au BufNewFile, BufRead *.py, *.cpp
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set fileformat=unix

"indent for web stuff
au BufNewFile, BufRead *.js, *.html, *.css, *.sls
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2

" Remove whitespace on save
autocmd BufRead, BufWritePre, FileWritePre * silent! %s/[\r \t]\+$//

" Tab sanity
set expandtab
set tabstop=4
set shiftwidth=4" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·" Different tab/space stops"
autocmd Filetype yaml       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css        setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype sls setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab

set ttyfast
set ignorecase
set smartcase
set ruler
set showmode
set showcmd
set title
set number
set hidden " This is what files look like
set ffs=unix,dos,mac " Update find path to search subdirectories
set path=$PWD/** " No backups
set nobackup
set nowritebackup
set nowb
set undolevels=1000 " Files to ignore
set showmatch " Show matching brackets
set wildmode=list:longest " Bash-like tab completion
set hlsearch " highlight all searched items
set incsearch " it starts searching as you type
" Python
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
" Temp files
set wildignore+=*.swp,~*
" Archives
set wildignore+=*.zip,*.tar
nnoremap <tab> %
vnoremap <tab> %

set laststatus=2
"setlocal spell
"set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

autocmd StdinReadPre * let s:std_in=1

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter, FocusGained, InsertLeave * set relativenumber
:  autocmd BufLeave, FocusLost, InsertEnter   * set norelativenumber
:augroup END

set t_RV=

" REMOVE ALL TRAILING WHITESPACE
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre     *.* :call TrimWhiteSpace()
