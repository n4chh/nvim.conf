local telescope = require("telescope.builtin")
local wk = require("which-key")
require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
}
