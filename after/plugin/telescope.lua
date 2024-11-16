local telescope = require("telescope.builtin")
local wk = require("which-key")
require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
}
wk.add({
  { "<leader>f", group = "Archivos" }, -- group
  { "<leader>ff", telescope.find_files, desc = "Buscar archivo", mode = "n" },
  { "<leader>ft", telescope.colorscheme, desc = "Buscar tema", mode = "n" },
  { "<leader>fw", function()
	  telescope.grep_string({ search = vim.fn.input("Buscar: ")})
  end,desc = "Buscar una palabra en los archivos" },
  { "<leader>fe", vim.cmd.Lexplore ,desc = "Explorador" },
  })
--vim.keymap.set("n","<leader>ff", telescope.find_files, {})
--vim.keymap.set("n","<C-p>", telescope.git_files, {})
--vim.keymap.set("n","<leader>fw", function()
--	telescope.grep_string({ search = vim.fn.input("|> ") })
--end)
