-- ============================================================================
--  vim-emoji
--  ===========================================================================

-- Bind options
local bind = vim.keymap.set

-- Set the complete func to emoji#complete and trigger it
bind('n', '<leader>ee', ':set completefunc=emoji#complete<cr>a<C-x><C-u><bs><bs><bs>')
bind('i', '<leader>ee', '<esc>:set completefunc=emoji#complete<cr>a<C-x><C-u><bs><bs><bs>')
