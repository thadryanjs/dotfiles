return {
    "hedyhli/outline.nvim",
    enabled = false,
    config = function()
        -- Example mapping to toggle outline
        vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
            providers = {
                priority = { 'coc', 'markdown', 'lsp', 'norg'},
                -- Configuration for each provider (3rd party providers are supported)
                lsp = {
                    -- Lsp client names to ignore
                    blacklist_clients = {},
                },
                markdown = {
                    -- List of supported ft's to use the markdown provider
                    filetypes = {'markdown'},
                },
            },
        }
    end,
}
-- https://github.com/hedyhli/outline.nvim
-- getting an error about no provider
