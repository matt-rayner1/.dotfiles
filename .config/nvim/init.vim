" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

"--------------------------------
" Plugins
"--------------------------------

" auto install plugin manager (vim-plug)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:polyglot_disabled = ['']

call plug#begin()
    Plug 'morhetz/gruvbox'

    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    
    Plug 'sheerun/vim-polyglot'

call plug#end()

"color theme
colorscheme gruvbox

"nerdtree Settings
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=0
"(set to '^node_modules$' if needed)
let g:NERDTreeIgnore = []

"coc extensions
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \]

"--------------------------------
" Plugin Keybinds 
"--------------------------------

let mapleader = "\<space>"

"Normal nerdtree toggle
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

"coc gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementaiton)
nmap <silent> gr <Plug>(coc-references)

"terminal escapes
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>k
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-\>h
nnoremap <A-j> <C-\>j
nnoremap <A-k> <C-\>k
nnoremap <A-l> <C-\>l

"Enter rebind (coc) to put closing bracket on newline (like vscode)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"fzf
nnoremap <silent> <leader>p :Files ~<CR>
nnoremap <silent> <C-p> :Files<CR>


"--------------------------------
" General Settings
"--------------------------------

"syntax on

set termguicolors

set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

set signcolumn=yes
set number
set relativenumber
set laststatus=2

set scrolloff=15
set sidescrolloff=10

set updatetime=300

set shortmess+=I

set nowrap

set hidden

" case-insensitive search (if all lowercase)
" case-sensitive if any capitals
set ignorecase
set smartcase

set nohlsearch
set incsearch

set noerrorbells visualbell t_vb=

set mouse+=a

"cmd-line tab completion
set wildmenu
set wildmode=longest:full,full

"set list
"set listchars=tab:>\,trail:.

set clipboard=unnamedplus

set splitright
set splitbelow

set termguicolors

"--------------------------------
" General Settings
"--------------------------------

nmap Q <Nop>

"Bad habit prevention (arrow keys)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
inoremap <Left> :echoe "Use h"<CR>
inoremap <Right> :echoe "Use l"<CR>
inoremap <Up> :echoe "Use k"<CR>
inoremap <Down> :echoe "Use j"<CR>

"edit/source vim config
nmap <leader>ve :tabedit ~/.config/nvim/init.vim<CR>
nmap <leader>vs :source ~/.config/nvim/init.vim<CR>

"gf to open non-existent Files
nmap gf :edit <cfile><CR>

"quicker window switching
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

"reselect visual seleciton after indent
vnoremap < <gv
vnoremap > >gv

"terminal window (add window switching?)
tnoremap <Esc> <C-\><C-n>
au bufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
    split term://zsh
    resize 13
endfunction

augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

nnoremap <leader>t :call OpenTerminal()<CR>
