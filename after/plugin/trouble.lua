local trouble = require("trouble")

trouble.setup({
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
})

vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() trouble.toggle('document_diagnostics') end)
vim.keymap.set("n", "<leader>xd", function() trouble.toggle("quickfix") end)
