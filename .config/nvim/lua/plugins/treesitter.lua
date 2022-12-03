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
