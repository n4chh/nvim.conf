vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Temas
	use 'Mofiqul/vscode.nvim'
	use 'loctvl842/monokai-pro.nvim'
	use 'projekt0n/github-nvim-theme'
	use "rebelot/kanagawa.nvim"
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	-- Barra
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	-- Sintaxis y cosas varias
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
	use({ 'neovim/nvim-lspconfig' })
	use({ 'hrsh7th/nvim-cmp' })
	use({ 'hrsh7th/cmp-nvim-lsp' })
	-- Explorador
	use('nvim-tree/nvim-tree.lua')
	use('nvim-tree/nvim-web-devicons')
	-- LSP
	use({ 'williamboman/mason.nvim' })
	use({ 'williamboman/mason-lspconfig.nvim' })
	-- Java
	use 'mfussenegger/nvim-jdtls'
	-- Debug
	use({ 'mfussenegger/nvim-dap' })
	use({ 'jay-babu/mason-nvim-dap.nvim' })
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
	-- TODO:
	use({ 'folke/which-key.nvim' })
	use 'f-person/auto-dark-mode.nvim'
	use 'audibleblink/hackthebox.vim'
	use 'navarasu/onedark.nvim'
	use 'norcalli/nvim-colorizer.lua'
	-- vim.cmd[[ PackerSync]]
end)
