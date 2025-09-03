return {
	{
		"rmehri01/onenord.nvim",
		opts = {},
	},
	{
		"thesimonho/kanagawa-paper.nvim",
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
	}
}
