
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Temas
  use 'Mofiqul/vscode.nvim'
  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Barra
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true}
  }
  -- Sintaxis y cosas varias
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
-- Explorador
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
-- TODO: 
  use({'williamboman/mason.nvim'})
  use({'williamboman/mason-lspconfig.nvim'})
  use({'folke/which-key.nvim'})
  use 'cormacrelf/dark-notify'
  use 'audibleblink/hackthebox.vim'
  use 'navarasu/onedark.nvim'
  use 'norcalli/nvim-colorizer.lua'
  -- vim.cmd[[ PackerSync]] 
end)

