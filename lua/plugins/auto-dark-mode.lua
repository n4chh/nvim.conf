-- Auto Dark/Light mode

vim.pack.add({
	"https://github.com/f-person/auto-dark-mode.nvim",
})
local adm = require("auto-dark-mode")
-- local lualine = require("lualine")

adm.setup({
	set_dark_mode = function()
		vim.api.nvim_set_option_value("background", "dark", {})
		-- local kanagawa_paper_ink = require("lualine.themes.kanagawa-paper-ink")
		-- lualine.setup({
		-- options = {
		-- 	theme = kanagawa_paper_ink,
		-- }
		-- })
		vim.cmd[[ colorscheme github_dark]]
	end,
	set_light_mode = function()
		-- local kanagawa_paper_canvas = require("lualine.themes.kanagawa-paper-canvas")
		-- lualine.setup({
		-- 	options = {
		-- 		theme = kanagawa_paper_canvas,
		-- 	}
		-- })
		vim.api.nvim_set_option_value("background", "light", {})
		vim.cmd[[ colorscheme github_light]]
	end,
	update_interval = 1000,
	fallback = "dark",
})
