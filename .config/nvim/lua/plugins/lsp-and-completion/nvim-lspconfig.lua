return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("*", {
            flags = {
                -- Debounce settings can improve performance
                debounce_text_changes = 150,
            },
            -- Example: Define common on_attach or capabilities here if desired
        })

        -- Initialize lspconfig to add its configurations to the runtime path
        require("lspconfig")

        -- List the servers you want to enable
        local servers = {
            "lua_ls",
            "ty"
        }

        -- Enable the listed servers.
        -- This triggers Neovim to look for configurations in the runtime path
        -- (both from lspconfig and your custom ~/.config/nvim/lsp/)
        vim.lsp.enable(servers)

        -- Optional: Add global keymaps for LSP functions here,
        -- perhaps within a general on_attach function passed to vim.lsp.config('*', ...)

    end
}
