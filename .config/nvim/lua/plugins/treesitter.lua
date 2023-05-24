local ts = require('nvim-treesitter.configs')

ts.setup({
  highlight = {
    enable = true
  },
  ensure_installed = {
    'bash',
    'c',
    'css',
    'eex',
    'elixir',
    'erlang',
    'heex',
    'html',
    'javascript',
    'json',
    'lua',
    'make',
    'markdown',
    'php',
    'python',
    'ruby',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml'
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
})

-- Set mdx to markdown
vim.treesitter.language.register('markdown', 'mdx')
-- Set livemd to markdown
vim.treesitter.language.register('markdown', 'livemd')
-- Set eelixir to html
vim.treesitter.language.register('html', 'eelixir')
