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
" Vim plugins {{{
call plug#begin('~/.config/nvim/plugged')

" Plugin Dev
" Plug '~/.config/nvim/plugged/potion'
" Plug '~/Projects/vim-markdown-folding'
" Plug '/home/mrdotb/Projects/vim/vim-42header'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'masukomi/vim-markdown-folding'
Plug 'neomake/neomake'
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'

" Colors & apparences
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'machakann/vim-highlightedyank'
" Plug 'ap/vim-buftabline'

" junegunn
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'

" Generate a prompt
Plug 'edkolev/promptline.vim'

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fireplace'

" Misc
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/DrawIt'
Plug 'mrdotb/vim-42header'

call plug#end()

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
set inccommand=split

syntax enable
" Resize split when window is resized
au VimResized * :wincmd =

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
nnoremap <silent> <leader>sv :write<cr>:source $MYVIMRC<cr>:nohlsearch<cr>

" open til
nnoremap <silent><leader>et :tabnew ~/Projects/til<cr>:lcd %<cr>

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
nnoremap <silent><cr> :nohlsearch<cr>

" Folding recursive open fold even if we already are inside fold
nnoremap <leader>O zczA

" Use o for newline
nnoremap o o<esc>
nnoremap O O<esc>

" -----------------------------------------------------------------------------
"  Quickfix
"  ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" -----------------------------------------------------------------------------
"  Buffers
"  ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
" -----------------------------------------------------------------------------

"  Tabs
"  ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" -----------------------------------------------------------------------------
"  FZF
"  ----------------------------------------------------------------------------
noremap  <silent> <leader><leader> :Files<cr>
nnoremap <silent> <leader>l        :Lines<cr>
noremap  <silent> <leader><enter>  :Buffers<cr>
nnoremap <silent> <leader>C        :Colors<cr>
nnoremap <silent> <leader>rg       :Rg<cr>
nnoremap <silent> <leader>'        :Marks<cr>

" -----------------------------------------------------------------------------
"  Tabular
"  ----------------------------------------------------------------------------
noremap <leader>t :Tabular /

" -----------------------------------------------------------------------------
"  REGISTER
"  ----------------------------------------------------------------------------
noremap x "xx
vnoremap p "_dP
noremap <leader>p "0p

" -----------------------------------------------------------------------------
"  vim-emoji
"  ----------------------------------------------------------------------------
nnoremap <leader>ee
  \ :set completefunc=emoji#complete<cr>a<C-x><C-u><bs><bs><bs>
inoremap <leader>ee
  \ <esc>:set completefunc=emoji#complete<cr>a<C-x><C-u><bs><bs><bs>

" -----------------------------------------------------------------------------
"  repeat last cmd
"  ----------------------------------------------------------------------------
nnoremap <leader><space> :!!<cr>

" -----------------------------------------------------------------------------
"  BROWSER
"  ----------------------------------------------------------------------------
" this use my custom script 
" https://github.com/mrdotb/dotfiles/blob/master/.local/bin/browser
" The function will take care of command vmode en motion
function! s:Browser(site, arg)
  let saved_unnamed_register = @@

  if a:arg ==# 'v'
    execute "normal! `<v`>y"
    let query = @@
  elseif a:arg ==# 'char'
    execute "normal! `[v`]y"
    let query = @@
  else
    let query = a:arg
  endif
  silent execute "!browser " . a:site . ' ' . query

  let @@ = saved_unnamed_register
endfunction

function! s:Duck(arg)
  call <SID>Browser('duck', a:arg)
endfunction

function! s:Fren(query)
  call <SID>Browser('fren', a:arg)
endfunction

function! s:EnFr(query)
  call <SID>Browser('enfr', a:arg)
endfunction

nnoremap <leader>d :set operatorfunc=<SID>Duck<cr>g@
vnoremap <leader>d :<c-u>call <SID>Browser('duck', visualmode())<cr>
command! -nargs=* Duck call <SID>Browser( 'duck', '<args>' )

nnoremap <leader>fr :set operatorfunc=<SID>Fren<cr>g@
vnoremap <leader>fr :<c-u>call <SID>Browser('fren', visualmode())<cr>
command! -nargs=* Fr call <SID>Browser( 'fren', '<args>' )

nnoremap <leader>en :set operatorfunc=<SID>Enfr<cr>g@
vnoremap <leader>en :<c-u>call <SID>Browser('enfr', visualmode())<cr>
command! -nargs=* En call <SID>Browser( 'enfr', '<args>' )

" }}}
" =============================================================================
" Languages {{{
" =============================================================================

" -----------------------------------------------------------------------------
"  markdown
"  ----------------------------------------------------------------------------

let g:vim_markdown_folding_disabled = 1
augroup ft_markdown
  autocmd!
  "fast block code
  " autocmd Filetype markdown nnoremap <leader>` i```<CR>```<Esc>kA
  " autocmd Filetype markdown inoremap <leader>` ```<CR>```<Esc>kA
  "autocmd Filetype markdown plugin indent on
  " autocmd Filetype markdown set foldmethod=expr
  " autocmd FileType markdown set foldexpr=NestedMarkdownFolds()
augroup END

" -----------------------------------------------------------------------------
"  vimscript
"  ----------------------------------------------------------------------------
augroup ft_vimscript
  autocmd!
  "fast block code
  autocmd Filetype vim set foldmethod=marker
augroup END

" -----------------------------------------------------------------------------
"  c 42 style
"  ----------------------------------------------------------------------------
augroup ft_c
  autocmd!
  autocmd Filetype c setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd Filetype c nnoremap ; $a;<esc>
  autocmd Filetype c setlocal foldmethod=syntax
  autocmd Filetype c set comments=sr:/*,m:**,ex:*/ 
  autocmd BufNewFile *.c Stdheader
augroup END

" -----------------------------------------------------------------------------
"  h 42 style
"  ----------------------------------------------------------------------------
augroup ft_h
  autocmd!
  autocmd Filetype cpp setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd BufNewFile *.c Stdheader
augroup END


" -----------------------------------------------------------------------------
"  scss
"  ----------------------------------------------------------------------------
augroup ft_scss
  autocmd!
  " autocmd Filetype scss nnoremap ; $a;<esc>
augroup END


" }}}
" =============================================================================
" Plugins settings {{{
" =============================================================================
"
" -----------------------------------------------------------------------------
"  Powerline
"  ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" -----------------------------------------------------------------------------
"  Colorscheme
"  ----------------------------------------------------------------------------
colorscheme dracula

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

nnoremap <leader>g :Goyo<cr>

" -----------------------------------------------------------------------------
"  Polyglot
"  ----------------------------------------------------------------------------
" Disable the polyglot markdown folding
let g:vim_markdown_folding_disabled = 1

" -----------------------------------------------------------------------------
"  Colorizer
"  ----------------------------------------------------------------------------
let g:colorizer_skip_comments = 1
let g:colorizer_auto_filetype='scss,css,html,javascript'

" -----------------------------------------------------------------------------
"  UltiSnips
"  ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

nnoremap <leader>u :UltiSnipsEdit<cr>

" -----------------------------------------------------------------------------
"  highlightedyank
"  ----------------------------------------------------------------------------
let g:highlightedyank_highlight_duration = 400

" -----------------------------------------------------------------------------
"  vim-42header
"  ----------------------------------------------------------------------------
let g:hdr42mail = "bchaleil@42.fr"
let g:hdr42user = "bchaleil"

" }}}
" =============================================================================
