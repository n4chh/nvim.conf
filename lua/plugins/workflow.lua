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
