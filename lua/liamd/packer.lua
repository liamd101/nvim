vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use "nvim-tree/nvim-web-devicons"
    use({
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            position = "right",
            width = 60,
            icons = false,
            mode = "workspace_diagnostics",
            group = true,
            padding = true,
            cycle_results = false,
            action_keys = {
                close = "<esc>",
                cancel = "q",
                refresh = "r",
                preview = "p",
                hover = "K",
            },
            multiline = true,
            indent_lines = false,
            auto_preview = false,
            fold_open = "v",
            fold_closed = ">",
            signs = {
                error = "error",
                warning = "warning",
                hint = "hint",
                information = "info",
            }
        }
    })
end)
