vim.g.mapleader = ' '
local wk = require("which-key")
-- Archivos
wk.add({
  { "<leader>f", group = "Archivos" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivo", mode = "n" },
  { "<leader>fn", desc = "Nuevo archivo" },
  { "<leader>fw", desc = "Buscar una palabra en los archivos" },
  })
-- Ventanas y buffers
wk.add({
  { "<leader>W", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  { "<leader>b", group = "Buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Cerrar" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Guardar" },
  }
})
