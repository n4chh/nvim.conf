vim.g.mapleader = ' '
local wk = require("which-key")
-- Ventanas y buffers
wk.add({
  { "<leader>b", group = "Buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  { "<leader>b[", "<cmd>bp<cr>", desc = "Buffer anterior"},
  { "<leader>b]", "<cmd>bn<cr>", desc = "Buffer posterior"},
  { "<leader>W", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Cerrar" },
    { "<leader>w", "<cmd>w<cr>", desc = "Guardar" },
  }
})
