local telescope = require("telescope")
local wk = require("which-key")
require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
}
telescope.load_extension("noice")
