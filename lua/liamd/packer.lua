vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    use('lervag/vimtex')
    use("PROgram52bc/vim-scallop")
    use('tpope/vim-fugitive')
    use('tmsvg/pear-tree')
    use('simrat39/rust-tools.nvim')
    use({ 'nvim-treesitter/nvim-treesitter', commit = 'f197a15', run = ':TSUpdate' })
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.5' })
    use({ 'github/copilot.vim' })

    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })

    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { "nvim-lua/plenary.nvim" },
    })

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            {
                'williamboman/mason.nvim',
                run = function()
                    call(vim.cmd, 'MasonUpdate')
                end,
            },
        },
    })

    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.0.0",
        run = "make install_jsregexp",
    })

    use("nvim-lua/plenary.nvim")
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
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                },
                follow_url_func = function(url)
                    vim.fn.jobstart({ "open", url })
                end,
                finder = "telescope.nvim",
                sort_by = "modified",
                sort_reversed = true,
                ui = {
                    enable = false,
                },
            })
        end,
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('ibl').setup({
                scope = { enabled = false },
            })
        end,
    })

    use({
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('trouble').setup({
                position = "right",
                width = 50,
                cycle_results = false,
                auto_preview = false,
                icons = false,
                multiline = true,
                action_keys = {
                    close = "<esc>",
                    cancel = "q",
                },
            })
        end,
    })

    use({
        "itchyny/lightline.vim",
        commit = "58c97bc21c6f657d3babdd4eefce7593e30e75ce",
    })

    use({
        "andweeb/presence.nvim",
        config = function()
            require("presence").setup({
                auto_update         = true,
                neovim_image_text   = "NeoVim",
                main_image          = "neovim",
                client_id           = "793271441293967371",
                log_level           = nil,
                debounce_timeout    = 10,
                enable_line_number  = false,
                buttons             = false,
                file_assets         = {},
                show_time           = true,

                -- Rich Presence text options
                editing_text        = "Editing %s",
                file_explorer_text  = "Browsing %s",
                reading_text        = "Reading %s",
                workspace_text      = "Working on %s",
            })
        end,
    })
end)
