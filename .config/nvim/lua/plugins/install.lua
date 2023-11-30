local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Colors & apparences
Plug('dracula/vim', { as = 'dracula' })
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'machakann/vim-highlightedyank'

-- Syntax
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/playground'
Plug 'towolf/vim-helm'
Plug 'nvim-lua/plenary.nvim'
Plug 'elixir-tools/elixir-tools.nvim'
Plug 'mhanberg/output-panel.nvim'

-- nvm cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

-- Coc
-- Plug('neoclide/coc.nvim', { branch  = 'release'})
-- Plug('elixir-lsp/coc-elixir', {['do'] = 'yarn install && yarn prepack'})
-- Plug('neoclide/coc-emmet', {['do'] = 'yarn install && yarn build'})
-- Plug('neoclide/coc-snippets', {['do'] = 'yarn install && yarn prepare'})

-- junegunn
Plug('junegunn/fzf', { dir = '~/.fzf',  ['do'] = './install --all' })
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim'

-- tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'

-- Generate a prompt
Plug 'edkolev/promptline.vim'

-- Misc
Plug 'valloric/matchtagalways'
Plug 'samoshkin/vim-mergetool'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-test/vim-test'
Plug 'ellisonleao/glow.nvim'

vim.call('plug#end')
