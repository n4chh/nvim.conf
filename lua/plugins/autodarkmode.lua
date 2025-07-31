return {
	"f-person/auto-dark-mode.nvim",
	config = function()
		local adm = require("auto-dark-mode")
		local lualine = require("lualine")

		adm.setup({
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				-- local kanagawa_paper_ink = require("lualine.themes.kanagawa-paper-ink")
				-- lualine.setup({ options = {
				-- 	theme = kanagawa_paper_ink,
				-- } })
				-- vim.cmd("colorscheme tokyonight")
				-- vim.cmd("colorscheme github_dark_high_contrast")
				vim.cmd("colorscheme github_dark")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				-- local kanagawa_paper_canvas = require("lualine.themes.kanagawa-paper-canvas")
				-- lualine.setup({ options = {
				-- 	theme = kanagawa_paper_canvas,
				-- } })
				-- vim.cmd("colorscheme tokyonight-day")
				-- vim.cmd("colorscheme github_light_high_contrast")
				vim.cmd("colorscheme github_light")
			end,
			update_interval = 1000,
			fallback = "dark",
		})
	end,
}
