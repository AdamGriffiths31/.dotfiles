vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
 	 }

	 use({
		 'catppuccin/nvim',
		 as = 'catppuccin',
		 config = function()
			 vim.cmd('colorscheme catppuccin')
		 end
	 })

     use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
     use('nvim-treesitter/playground')
     use('theprimeagen/harpoon')
     use('mbbill/undotree')
     use('tpope/vim-fugitive')
     use('fatih/vim-go')
     use('rafamadriz/friendly-snippets')
     use { 'L3MON4D3/LuaSnip' }
     use {
         'hrsh7th/nvim-cmp',
         config = function ()
             require'cmp'.setup {
                 snippet = {
                     expand = function(args)
                         require'luasnip'.lsp_expand(args.body)
                     end
                 },

    sources = {
      { name = 'luasnip' },
      -- more sources
    },
  }
  end
}
use { 'saadparwaiz1/cmp_luasnip' }   

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
}
}     
 end)
