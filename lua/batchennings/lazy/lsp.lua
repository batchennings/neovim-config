return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local on_attach = function(client, bufnr)
            -- format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function() vim.lsp.buf.format({id=client.id }) end
                })
            end
        end

        -- TypeScript
        vim.lsp.config('ts_ls', {
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
            root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'typescript', 'typescriptreact', 'typescript.tsx' },
            callback = function(args)
                vim.lsp.enable('ts_ls')
                local client = vim.lsp.get_clients({ bufnr = args.buf, name = 'ts_ls' })[1]
                if client then
                    on_attach(client, args.buf)
                end
            end,
        })

        -- Tailwind
        vim.lsp.config('tailwindcss', {
            cmd = { "tailwindcss-language-server", "--stdio" },
            root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'package.json' },
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            callback = function(args)
                vim.lsp.enable('tailwindcss')
            end,
        })

        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
