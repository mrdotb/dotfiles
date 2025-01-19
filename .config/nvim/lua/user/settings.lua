-- Set truecolor
vim.opt.termguicolors = true

-- Set dracula colorscheme
vim.cmd('colorscheme tokyonight')

-- Set powerline fonts
vim.cmd([[let g:airline_powerline_fonts=1]])

-- Ignore the case when the search pattern is all lowercase
vim.opt.smartcase = true

-- Highlight search result
vim.opt.hlsearch = true

-- Show curent match while typing
vim.opt.incsearch = true

-- Show match in split
vim.opt.inccommand = 'split'

-- Disable mouse
vim.opt.mouse = ''

-- Enable cursorline
vim.opt.cursorline = false

-- 80 chars highlight per line per line
vim.opt.colorcolumn = '80'

-- Set grep default grep command to ripgrep
vim.opt.grepprg = 'rg --vimgrep --follow'
vim.opt.errorformat:append('%f:%l:%c%p%m')

-- Show partial command in the last line of the screen
vim.opt.showcmd = true

-- Keep 5 lines below cursor when scrolling
vim.opt.scrolloff = 5

-- Use system clipboard if available
if vim.fn.has('unnamedplus') == 1 then
  vim.opt.clipboard = 'unnamedplus'
else
  vim.opt.clipboard = 'unnamed'
end

-- Time in milliseconds to wait for a mapped sequence to complete
vim.opt.timeoutlen = 500

-- Use visual bell isntead of beeping
vim.opt.visualbell = true

-- Show tabs as ">" space as "-" and non-breakable characters as "+"
vim.opt.list = true

-- Change the displayed number relative to the cursor
vim.opt.relativenumber = true

-- Set tab as space
vim.opt.expandtab = true

-- Set tabs as two spaces width
vim.opt.tabstop = 2

-- Set shiftwidth as two spaces
vim.opt.shiftwidth = 2

-- Set autoindent like tabstop
vim.opt.shiftwidth = 0

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Open vim diagnostic
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
