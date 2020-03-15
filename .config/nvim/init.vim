" MrdotB vimrc
set encoding=utf-8

set list
set listchars=tab:␉·,trail:␠
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set number
set relativenumber

let mapleader = "\\"

" set foldmethod=indent
" set nofoldenable
" set foldnestmax=10


" Markdown shortcut {{{
augroup ft_markdown
  autocmd!
  "fast code block
  autocmd Filetype markdown nnoremap <leader>` i```<CR>```<Esc>k$a
augroup END
" }}}

" Vim Register settings {{{
" Set default register to system clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap x "_x
vnoremap p "_dP
noremap <leader>p "0p
" }}}

" Sane Vim settings {{{
syntax enable
set title
" disable mouse
set mouse=""
" Resize split when window is resized
au VimResized * :wincmd =
" }}}

" Vimscript file settings -------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Vim Search settings {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" Disable search result when Carriage Return
nnoremap <CR> :nohlsearch<CR>
"}}}

" noremap {{{
" use magic regex by default
nnoremap / /\v
nnoremap ? ?\v
" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" completion change default binding
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" disable arrows
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
" }}}

" vim plugins {{{
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
Plug 'vim-scripts/DrawIt'
Plug 'mrdotb/vim-markdown-folding'
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif
call plug#end()

" vim-markdown fold
let g:vim_markdown_folding_disabled = 1
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif
" Set colorscheme after loading the theme
colorscheme dracula

" }}}
