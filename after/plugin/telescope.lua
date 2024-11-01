local telescope = require("telescope.builtin")

vim.keymap.set("n","<leader>ff", telescope.find_files, {})
vim.keymap.set("n","<C-p>", telescope.git_files, {})
vim.keymap.set("n","<leader>fw", function()
	telescope.grep_string({ search = vim.fn.input("|> ") })
end)
