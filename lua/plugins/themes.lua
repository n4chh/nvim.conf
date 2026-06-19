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
		-- vim.cmd[[ colorscheme vague ]]
	end,
	set_light_mode = function()
		-- local kanagawa_paper_canvas = require("lualine.themes.kanagawa-paper-canvas")
		-- lualine.setup({
		-- 	options = {
		-- 		theme = kanagawa_paper_canvas,
		-- 	}
		-- })
		vim.api.nvim_set_option_value("background", "light", {})
		-- vim.cmd[[ colorscheme dayfox ]]
	end,
	update_interval = 1000,
	fallback = "dark",
})

return {
	{
		"rmehri01/onenord.nvim",
		opts = {},
	},
	{
	},
	
	{
		opts = {},
	},
	{
		"lunacookies/vim-colors-xcode",
		opts = {},
		config = function()
		end
	},
	{
		'Mofiqul/vscode.nvim'
	},
	{
		"scottmckendry/cyberdream.nvim",
		config = function()
			require("cyberdream").setup({
				variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
				transparent = true,
				saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
				italic_comments = true,
			})
		end
	},
	{
	}
}
