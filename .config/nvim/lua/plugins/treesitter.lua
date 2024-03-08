local ts = require('nvim-treesitter.configs')

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});

ts.setup({
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end
  },
  ensure_installed = {
    'bash',
    'c',
    'css',
    'eex',
    'elixir',
    'erlang',
    'go',
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
    'rust',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim'
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
