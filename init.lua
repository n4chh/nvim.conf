vim.cmd [[packadd packer.nvim]]
require("plugins")
require("config.mappings")
require("config.colors")
vim.opt.signcolumn = "yes"
vim.o.number = true
vim.o.relativenumber = true
vim.cmd.colorscheme("onedark")
--vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
vim.o.ts = 4
vim.o.sw = 4

