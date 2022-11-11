-- ============================================================================
-- fzf.vim
-- ============================================================================

-- Bind options
local bind = vim.keymap.set

bind('n', '<leader><leader>', ':Files<cr>')
bind('n', '<leader>l', ':Lines<cr>')
bind('n', '<leader><enter>', ':Buffers<cr>')
bind('n', '<leader>rg', ':Rg<cr>')
bind('n', '<leader>C', ':Colors<cr>')
bind('n', '<leader>\'', ':Marks<cr>')
