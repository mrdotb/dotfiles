-- ============================================================================
--  vim-test
--  ===========================================================================

-- Bind options
local bind = vim.keymap.set
local bind_opts = {remap = true, silent = true}

-- Plugin bind
bind('n', 't<c-n>', ':TestNearest<cr>', bind_opts)
bind('n', 't<c-f>', ':TestFile<cr>', bind_opts)
bind('n', 't<c-s>', ':TestSuite<cr>', bind_opts)
bind('n', 't<c-l>', ':TestLast<cr>', bind_opts)
bind('n', 't<c-g>', ':TestVisit<cr>', bind_opts)
