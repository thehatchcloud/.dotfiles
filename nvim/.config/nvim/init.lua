-- Set my leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Bootstrap lazy.nvim package manager --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- End: Bootstrap lazy.nvim package manager --

-- Install and configure packages -- 
require("lazy").setup({
	--plugins
	{
		-- Fuzzy finder
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {

			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
	},
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
    },


	-- Color schemes go here
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown", -- or 'event = "VeryLazy"'
        opts = {
            -- configuration here or empty for defaults
        },
    }
},
{
	-- opts
})

-- Additional loads
require("nwhatch")
