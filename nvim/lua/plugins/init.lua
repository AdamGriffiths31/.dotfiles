local Plugins = {
  {"catppuccin/nvim", name = "catppuccin"},
  {'tpope/vim-fugitive'},
  {'theprimeagen/harpoon'},
  {'fatih/vim-go'},
  {'mbbill/undotree'},
  {'kyazdani42/nvim-tree.lua'},
  {
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                              , branch = '0.1.1',
	dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    }
  },
}

return Plugins
