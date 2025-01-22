local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
    'ruff',
    'hls',
})

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
    }
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    client.server_capabilities.semanticTokensProvider = nil

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            update_in_insert = true,
        }
    )
end)

local lspconfig = require('mason-lspconfig')

lspconfig.setup({
    ensure_installed = {
        "hls",
    }
})


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lsp.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
    flags = {
        debounce_text_changes = 100,
    },
    sources = sources,
})

require('lspconfig').pyright.setup {
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
}

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

-- HLS (Haskell Language Server) configuration
require('lspconfig').hls.setup({
    -- Specific version of HLS
    -- cmd = { "haskell-language-server-wrapper", "--lsp", "--version", "2.9.0.1" },

    -- Configure HLint
    init_options = {
        haskell = {
            formattingProvider = "ormolu", -- Set formatter to ormolu
            checkProject = true,
        },
        plugin = {
            hlint = {
                globalOn = true,
                diagnosticsOn = true,
                codeActionsOn = true,
                diagnosticSeverity = "Warning", -- Set HLint to warning level
            },
        },
    },

    -- Environment settings
    cmd_env = {
        PATH = vim.fn.expand("$HOME/.ghcup/bin:$PATH"),
    },
})

-- Additional settings for better Haskell experience
vim.g.haskell_enable_quantification = 1   -- Enable highlighting of forall
vim.g.haskell_enable_recursivedo = 1      -- Enable highlighting of mdo and rec
vim.g.haskell_enable_arrowsyntax = 1      -- Enable highlighting of proc
vim.g.haskell_enable_pattern_synonyms = 1 -- Enable highlighting of pattern
vim.g.haskell_enable_typeroles = 1        -- Enable highlighting of type roles
vim.g.haskell_enable_static_pointers = 1  -- Enable highlighting of static

-- Set up additional keybindings for Haskell development
vim.api.nvim_create_autocmd("FileType", {
    pattern = "haskell",
    callback = function()
        -- Set local keybindings for Haskell files
        local opts = { buffer = true }
        vim.keymap.set('n', '<leader>ht', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>hi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>hr', vim.lsp.buf.references, opts)
    end,
})
