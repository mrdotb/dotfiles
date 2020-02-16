" MrdotB vimrc
set encoding=utf-8

set mouse=""

set listchars=tab:␉·,trail:␠
set list

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set number
set relativenumber

set foldmethod=indent
set nofoldenable
set foldnestmax=10

set hlsearch
set incsearch
set ignorecase
set smartcase
" Disable search result when Carriage Return
map <CR> :nohl<CR>

" Use sys clipboard
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

" Resize split when window is resized
au VimResized * :wincmd =

set title

inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neomake/neomake'
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '~50%' }
  map <C-[> :Files<C-[>

Plug 'edkolev/promptline.vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

Plug 'mattn/emmet-vim'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()
colorscheme dracula
"set background=dark
syntax enable

"disable arrows
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
