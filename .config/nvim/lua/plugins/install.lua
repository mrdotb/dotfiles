local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Colors & apparences
Plug('dracula/vim', { as = 'dracula' })
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'machakann/vim-highlightedyank'

-- Syntax
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Coc
Plug('neoclide/coc.nvim', { branch  = 'release'})
Plug('elixir-lsp/coc-elixir', {['do'] = 'yarn install && yarn prepack'})
Plug('neoclide/coc-emmet', {['do'] = 'yarn install && yarn build'})
Plug('neoclide/coc-snippets', {['do'] = 'yarn install && yarn prepare'})

-- junegunn
Plug('junegunn/fzf', { dir = '~/.fzf',  ['do'] = './install --all' })
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'

-- tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'

-- Generate a prompt
Plug 'edkolev/promptline.vim'

-- Misc
Plug 'valloric/matchtagalways'
Plug 'samoshkin/vim-mergetool'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-test/vim-test'

vim.call('plug#end')
