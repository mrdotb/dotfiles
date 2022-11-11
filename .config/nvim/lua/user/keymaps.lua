-- Bind options
local bind = vim.keymap.set
local remap = {remap = true}
local silent = {silent = true}

-- Leader
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Edit nvim config
bind('', '<leader>ev', ':tabnew ~/.config/nvim/init.lua<cr>')

-- Source nvim config
bind('', '<leader>sv', ':luafile ~/.config/nvim/init.lua<cr>')

-- Disable arrows
bind('n', '<up>', '<nop>')
bind('n', '<down>', '<nop>')
bind('n', '<left>', '<nop>')
bind('n', '<right>', '<nop>')
bind('i', '<up>', '<nop>')
bind('i', '<down>', '<nop>')
bind('i', '<left>', '<nop>')
bind('i', '<right>', '<nop>')

-- Use o, O to insert newline newline
bind('n', 'o', 'o<esc>')
bind('n', 'O', 'O<esc>')

-- Disable search result when Carriage Return
bind('n', '<cr>', ':nohlsearch<cr>', silent)

-- Buffers
bind('n', ']b', ':bnext<cr>')
bind('n', '[b', ':bprev<cr>')

-- Remap x to cut in the "x register
bind('n', 'x', '"xx')
bind('v', 'x', '"xx')
