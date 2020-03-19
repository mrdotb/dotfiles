" =============================================================================
"                         _       _   _             _
"       _ __ ___  _ __ __| | ___ | |_| |__   __   _(_)_ __ ___  _ __ ___
"      | '_ ` _ \| '__/ _` |/ _ \| __| '_ \  \ \ / / | '_ ` _ \| '__/ __|
"      | | | | | | | | (_| | (_) | |_| |_) |  \ V /| | | | | | | | | (__
"      |_| |_| |_|_|  \__,_|\___/ \__|_.__/    \_/ |_|_| |_| |_|_|  \___|
" =============================================================================

let mapleader = '\'
let maplocalleader = '\'

" =============================================================================
" vim plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug '~/.config/nvim/plugged/potion'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neomake/neomake'
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'edkolev/promptline.vim'

Plug 'tpope/vim-commentary'
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
" =============================================================================
" Basic settings {{{
" =============================================================================
set encoding=utf-8
set smartindent
" set lazyredraw
set laststatus=2
set showcmd
set visualbell
set timeoutlen=500
" set shortmess=aIT
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set list
set listchars=tab:␉·,trail:␠
set number
set relativenumber
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
set cursorline
" disable mouse
set mouse=""
" 80 chars/line
set colorcolumn=80
" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase


syntax enable
" Resize split when window is resized
au VimResized * :wincmd =

set foldlevelstart=0

" }}}
" =============================================================================
" Mappings {{{
" =============================================================================

" -----------------------------------------------------------------------------
"  Basic Mappings
"  ----------------------------------------------------------------------------
" use magic regex by default in search
nnoremap / /\v
nnoremap ? ?\v

" edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" completion, change default binding
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

" Disable search result when Carriage Return
nnoremap <CR> :nohlsearch<CR>

" -----------------------------------------------------------------------------
"  Quickfix
"  ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" -----------------------------------------------------------------------------
"  FZF
"  ----------------------------------------------------------------------------
noremap <silent> <leader><leader> :Files<cr>
nnoremap <silent> <leader>l  :Lines<cr>
noremap <silent> <leader><enter> :Buffers<cr>
nnoremap <silent> <leader>C :Colors<cr>
nnoremap <silent> <leader>rg :Rg<cr>
nnoremap <silent> <leader>' :Marks<cr>

" -----------------------------------------------------------------------------
"  REGISTER
"  ----------------------------------------------------------------------------
noremap x "_x
vnoremap p "_dP
noremap <leader>p "0p
" }}}
" =============================================================================
" Markdown shortcut {{{
augroup ft_markdown
  autocmd!
  "fast code block
  autocmd Filetype markdown nnoremap <leader>` i```<CR>```<Esc>kA
  autocmd Filetype markdown inoremap <leader>` ```<CR>```<Esc>kA
augroup END

" }}}
" =============================================================================
" Plugins settings {{{
" =============================================================================
"
" -----------------------------------------------------------------------------
"  Goyo
"  ----------------------------------------------------------------------------
function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
  endif

  set nocursorline
  Limelight
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif

  set cursorline
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}
" =============================================================================
