local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"VonHeikemen/lsp-zero.nvim",
	--Deps of lsp-zero
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	--End of Deps

	"ThePrimeagen/harpoon",
	"mbbill/undotree",

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		'thimc/gruber-darker.nvim',
		config = function()
			require('gruber-darker').setup({
				-- OPTIONAL
				transparent = true, -- removes the background
				-- underline = false, -- disables underline fonts
				-- bold = false, -- disables bold fonts
			})
			vim.cmd.colorscheme('gruber-darker')
		end,
	},

	{{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	}}


})




