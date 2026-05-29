
vim.pack.add({
	"https://github.com/akinsho/toggleterm.nvim",
})

require("toggleterm").setup({})

-- VGit
vim.pack.add({
	'https://github.com/tanvirtin/vgit.nvim',
	-- deps
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
})
require("vgit").setup({})
vim.pack.add({
	-- Discord Presence
	"https://github.com/andweeb/presence.nvim",
	-- FZF: doesn't need to call "require"
	"https://github.com/junegunn/fzf.vim",
	-- FZF dependencies
	"https://github.com/junegunn/fzf",
})
require("presence").setup({
	editing_text = function() return "Editing " .. vim.fn.expand("%:.") end,
	reading_text = function() return "Reading " .. vim.fn.expand("%:.") end,
})
