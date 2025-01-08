vim.cmd [[packadd packer.nvim]]
vim.o.termguicolors = true
require("config.colors")
require("plugins")
require("config.mappings")
vim.opt.signcolumn = "yes"
vim.o.number = true
vim.o.undofile = true
vim.o.relativenumber = true
-- vim.cmd.colorscheme("hackthebox")
--vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
vim.o.ts = 4
vim.o.sw = 4

