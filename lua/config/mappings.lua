vim.g.mapleader = ' '
local wk = require("which-key")
-- Ventanas y buffers
wk.add({
  { "<leader>b", group = "Buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  { "<leader>d", group = "Diagnósticos" },
  { "<leader>df", vim.diagnostic.open_float, desc = "Mostrar diagnóstico."},
  -- Después de nvim 10, K se habilitó por defecto al hover del
-- lsp.
  { "[b", "<cmd>bp<cr>", desc = "Buffer anterior"},
  { "]b", "<cmd>bn<cr>", desc = "Buffer posterior"},
  { "<leader>W", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Cerrar" },
    { "<leader>w", "<cmd>w<cr>", desc = "Guardar" },
  }
})
