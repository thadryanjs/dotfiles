return {
    {
        "jpalardy/vim-slime",
        -- commit = "6dc1b7fa0473048a1346e9f09b33a0253e494e06",
        config = function()
            vim.g.slime_cell_delimiter = "# %%"
            vim.g.slime_target = "tmux"
            vim.g.slime_python_ipython = 0
            -- don't ask for target pane
            -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
            vim.api.nvim_set_keymap("n", "<leader>ss", ":SlimeSendCurrentLine<cr><cr>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>sc", "<Plug>SlimeSendCell", { noremap = true, silent = true })
            --vim.api.nvim_set_keymap("n", "<leader>sc", "<Plug>SlimeCellsSendAndGoToNext", { noremap = true, silent = true })
        end
    }
}
