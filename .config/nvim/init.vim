" MrdotB vimrc

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
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
map <C-[> :Files<C-[>

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

" Basic settings {{{
" =====================================================
set encoding=utf-8
set smartindent
" set lazyredraw
set laststatus=2
set showcmd
set visualbell
set shortmess=aIT
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
set title

let mapleader = "\\"

syntax enable
" Resize split when window is resized
au VimResized * :wincmd =

set foldlevelstart=0
" set foldmethod=indent
" set nofoldenable
" set foldnestmax=10
" =====================================================
" }}}

" Functional Vim {{{
function! Sorted(l)
  let new_list = deepcopy(a:l)
  call sort(new_list)
  return new_list
endfunction

function! Reversed(l)
  let new_list = deepcopy(a:l)
  call reverse(new_list)
  return new_list
endfunction

function! Append(l, val)
  let new_list = deepcopy(a:l)
  call add(new_list, a:val)
  return new_list
endfunction

function! Assoc(l, i, val)
  let new_list = deepcopy(a:l)
  let new_list[a:i] = a:val
  return new_list
endfunction

function! Pop(l, i)
  let new_list = deepcopy(a:l)
  call remove(new_list, a:i)
  return new_list
endfunction

function! Mapped(fn, l)
  let new_list = deepcopy(a:l)
  call map(new_list, string(a:fn) . '(v:val)')
  return new_list
endfunction

function! Filtered(fn, l)
  let new_list = deepcopy(a:l)
  call filter(new_list, string(a:fn) . '(v:val)')
  return new_list
endfunction

function! Removed(fn, l)
  let new_list = deepcopy(a:l)
  call filter(new_list, string(a:fn) . '(v:val)')
  return new_list
endfunction

" }}}

" Toggle special {{{
nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>

function! s:FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

nnoremap <leader>q :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window."wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction
" }}}

" Grep shortcut {{{
" :nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
:nnoremap <leader>j :cnext<cr>
:nnoremap <leader>k :cprevious<cr>

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
      execute "normal! `<v`>y"
  elseif a:type ==# 'char'
      execute "normal! `[v`]y"
  else
      return
  endif

  silent execute "grep! -R " . shellescape(@@) . " ."
  copen

  let @@ = saved_unnamed_register
endfunction
" }}}

" Markdown shortcut {{{
augroup ft_markdown
  autocmd!
  "fast code block
  autocmd Filetype markdown nnoremap <leader>` i```<CR>```<Esc>kA
  autocmd Filetype markdown inoremap <leader>` ```<CR>```<Esc>kA
augroup END
" }}}

" Vim Register settings {{{
" Set default register to system clipboard
noremap x "_x
vnoremap p "_dP
noremap <leader>p "0p
" }}}

" Vimscript file settings -------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  nnoremap <space>fn ifunction! <cr>endfunction<esc>kA
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
nnoremap <leader>ev :below:split $MYVIMRC<cr>

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

