return {
	"f-person/auto-dark-mode.nvim",
	config = function()
		local adm = require("auto-dark-mode")

		adm.setup({
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd("colorscheme monokai-pro")
				-- vim.cmd("colorscheme github_dark")
				-- onedark.setup {
				-- 	style = 'darker',
				-- 	-- colors = {
				-- 	-- 	green = "#9fef00",
				-- 	-- 	bright_green = "#c5f467",
				-- 	-- 	white = "#ffffff",
				-- 	-- 	bright_white = "#c5d1eb",
				-- 	-- 	black = "#000000",
				-- 	-- 	bright_black = "#666666",
				-- 	-- 	red = "#ff3e3e",
				-- 	-- 	bright_red = "#ff8484",
				-- 	-- 	blue = "#2e6cff",
				-- 	-- 	bright_blue = "#5cb2ff",
				-- 	-- 	yellow = "#ffaf00",
				-- 	-- 	bright_yellow = "#ffcc5c",
				-- 	-- 	purple = "#9f00ff",
				-- 	-- 	bright_purple = "#cf8dfb",
				-- 	-- 	cyan = "#2ee7b6",
				-- 	-- 	bright_cyan = "#5cecc6",
				-- 	-- 	fg = "#a4b1cd",
				-- 	-- 	bg0 = "#1a2332",
				-- 	-- 	bg1 = "#1a2332",
				-- 	-- 	bg2 = "#1a2332",
				-- 	-- 	bg3 = "#2a3342",
				-- 	-- 	bg_d = "#1a2332",
				-- 	-- }, -- htb colors
				-- }
				-- onedark.load()
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme monokai-pro")
				-- vim.cmd("colorscheme github_light")
				-- onedark.setup {
				-- 	style = 'light',
				-- 	-- colors = {
				-- 	-- green = "#9fef00",
				-- 	-- bright_green = "#c5f467",
				-- 	-- white = "#ffffff",
				-- 	-- bright_white = "#c5d1eb",
				-- 	-- black = "#000000",
				-- 	-- bright_black = "#666666",
				-- 	-- red = "#ff3e3e",
				-- 	-- bright_red = "#ff8484",
				-- 	-- blue = "#2e6cff",
				-- 	-- bright_blue = "#5cb2ff",
				-- 	-- yellow = "#ffaf00",
				-- 	-- bright_yellow = "#ffcc5c",
				-- 	-- purple = "#9f00ff",
				-- 	-- bright_purple = "#cf8dfb",
				-- 	-- cyan = "#2ee7b6",
				-- 	-- bright_cyan = "#5cecc6",
				-- 	-- fg = "#1a2332",
				-- 	-- bg0 = "#a4b1cd",
				-- 	-- bg1 = "#a4b1cd",
				-- 	-- bg2 = "#a4b1cd",
				-- 	-- bg3 = "#94a1bd",
				-- 	-- bg_d = "#a4b1cd",
				-- 	-- }
				-- }
				-- onedark.load()
			end,
			update_interval = 3000,
			fallback = "dark",
		})
	end,
}
