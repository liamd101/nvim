-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

   use {
 	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
 	  -- or                            , branch = '0.1.x',
 	  requires = { {'nvim-lua/plenary.nvim'} }
 }

   use({
 	'rafamadriz/neon',
 	as = "neon",
 	-- config = function()
 	-- 	vim.cmd('colorscheme neon')
 	-- end
   })

   use({
       'mhartington/oceanic-next',
       as = "OceanicNext",
       config = function()
           vim.cmd('colorscheme OceanicNext')
       end
   })


   use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
   use('ThePrimeagen/harpoon')
   use('tpope/vim-fugitive')
   use('tmsvg/pear-tree')

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
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.0.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    run = "make install_jsregexp",
  })

  use('lervag/vimtex')


  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

end)
