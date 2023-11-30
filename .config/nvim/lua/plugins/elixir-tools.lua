-- ============================================================================
-- elixir-tools
-- ============================================================================

-- Bind options
local bind = vim.keymap.set

bind("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
bind("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
bind("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })

-- Config
local elixir = require("elixir")

elixir.setup {
  nextls = {
    enable = false
  },
  credo = {
    enable = true
  },
  elixirls = {
    enable = true
  }
}
