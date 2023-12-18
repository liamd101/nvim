vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use {
     'nvim-telescope/telescope.nvim', tag = '0.1.2',
  }

  use({
      'mhartington/oceanic-next',
      as = "OceanicNext",
      config = function()
          vim.cmd('colorscheme OceanicNext')
      end
  })


  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!

  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

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
    tag = "v2.0.0",
    run = "make install_jsregexp",
  })

  use('lervag/vimtex')

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use("PROgram52bc/vim-scallop")

  use('github/copilot.vim')

  use({
    "epwalsh/obsidian.nvim",
    tag = "*",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('obsidian').setup({
        workspaces = {
          {
            name = "personal",
            path = "~/vaults/personal",
          },
        },

        mappings = {
          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
              end,
            opts = { noremap = false, expr = true, buffer = true },
          },
        },

       follow_url_func = function(url)
          vim.fn.jobstart({"open", url})
        end,

        finder = "telescope.nvim",

        sort_by = "modified",

        sort_reversed = true,

      })
    end,
  })

  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

end)
