

-- Lspconfig

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig"
})

vim.lsp.enable({
	"lua_ls",
	"zls",
	"pyright",
	"gopls",
	"clangd",
	"ts_ls",
	"rust_analyzer"
	-- "asm_lsp",
})

-- TreeSitter


vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- dependencies
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/OXY2DEV/markview.nvim" ,
})


require("markview").setup {
	preview = {
      filetypes = { "markdown", "Avante" },
      ignore_buftypes = {},
    },
    max_length = 99999,
}

local ensure_installed = {
	"bash",
	"c",
	"cpp",
	"css",
	"csv",
	"dockerfile",
	"fish",
	"gitignore",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"make",
	"markdown",
	"python",
	"query",
	"rust",
	"scss",
	"sql",
	"toml",
	"typescript",
	"vim",
	"vimdoc",
}

require("nvim-treesitter").install(
	ensure_installed
)


-- Mason
vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
})

require("mason").setup()
