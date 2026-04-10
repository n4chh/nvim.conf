vim.o.termguicolors = true
vim.opt.signcolumn = "yes"
vim.o.number = true
vim.o.undofile = true
vim.o.relativenumber = true
--vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
vim.o.ts = 4
vim.o.sw = 4
vim.o.winborder = "rounded"
vim.o.wrap = false
if vim.g.vscode then
	require("vscode_settings")
else

	require("plugins.explorer")
	require("plugins.lsp")
	require("plugins.cmp")
	require("plugins.mappings")
	require("plugins.ui")
	require("plugins.workflow")
	require("plugins.ai")

	require("themes.rosepine")
	require("themes.kanagawa")
	require("themes.catppuccin")

	vim.cmd [[colorscheme catppuccin]]
	require("auto")
end
