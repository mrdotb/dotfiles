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
Plug '/home/john/Projects/vim/vim-tailwindcss'

" Syntax
let g:polyglot_disabled = ['elixir']
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'valloric/matchtagalways'

" Colors & apparences
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'machakann/vim-highlightedyank'

" junegunn
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'

" Generate a prompt
Plug 'edkolev/promptline.vim'

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'

" Misc
Plug 'samoshkin/vim-mergetool'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-test/vim-test'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

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
" Buffer hidden
set hidden

syntax enable
" Resize split when window is resized
autocmd VimResized * :wincmd =
" Close Preview window after completion is done
autocmd CompleteDone * pclose

let g:python_host_prog = '~/.asdf/installs/python/2.7.18/bin/python'
let g:python3_host_prog = '~/.asdf/installs/python/3.6.12/bin/python'

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
"  vim-test
"  ----------------------------------------------------------------------------
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

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
"  vim-tailwind
"  ----------------------------------------------------------------------------
nnoremap <leader>tt
  \ :set completefunc=tailwind#complete<cr>
inoremap <leader>tt
  \ <esc>:set completefunc=tailwind#complete<cr>a

" -----------------------------------------------------------------------------
"  repeat last cmd
"  ----------------------------------------------------------------------------
nnoremap <leader><space> :!!<cr>

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
let g:instant_markdown_autoscroll = 1

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
" -----------------------------------------------------------------------------
"  vim-mergetool
"  ----------------------------------------------------------------------------
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

" -----------------------------------------------------------------------------
"  Powerline
"  ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" -----------------------------------------------------------------------------
"  Colorscheme
"  ----------------------------------------------------------------------------
colorscheme dracula

" -----------------------------------------------------------------------------
"  Matchtagalways
"  ----------------------------------------------------------------------------

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'eelixir' : 1,
    \ 'eex' : 1,
    \ 'leex' : 1,
    \}

" -----------------------------------------------------------------------------
"  Polyglot
"  ----------------------------------------------------------------------------
" Disable the polyglot markdown folding
let g:vim_markdown_folding_disabled = 1


" -----------------------------------------------------------------------------
"  Coc-snippets
"  ----------------------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Add shortcut to edit snippets
nnoremap <leader>ec :tabnew ~/.config/nvim/UltiSnips<cr>


" -----------------------------------------------------------------------------
"  highlightedyank
"  ----------------------------------------------------------------------------
let g:highlightedyank_highlight_duration = 400


" -----------------------------------------------------------------------------
"  Coc config
" =============================================================================

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}
