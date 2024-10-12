return {
    {
        "natecraddock/workspaces.nvim",
        config = function()
            require("workspaces").setup({
                path = "/home/thadryan/Documents/WorkVault/Resources/Templates/workspaces.txt"
                -- path = "/home/thadryan/.config/workspaces.txt"
            })

        vim.api.nvim_set_keymap("n", "<leader>wf", ":Telescope workspaces<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>wv", ":e /home/thadryan/Documents/Vault/index.md<CR>",
                { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>wi", ":e index.md<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>wa", ":WorkspacesAdd<CR>", { noremap = true, silent = true })

        end
    }
}
