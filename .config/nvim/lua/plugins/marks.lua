return {
    {
        "chentoast/marks.nvim",
        config = function()
            require('marks').setup{
                mappings = {
                    next = "<leader>mn",
                    prev = "<leader>mp",
                    toggle = "<leader>mt",
                    delete_line = "<leader>md",
                    delete_buf = "<leader>mr"
                }
            }
            -- these didn't work
            -- vim.api.nvim_set_keymap('n', '<leader>mm', "<cmd>lua require('marks').toggle_mark()<CR>", { noremap = true, silent = true })
            -- vim.api.nvim_set_keymap('n', '<leader>mn', "<cmd>lua require('marks').next_mark()<CR>", { noremap = true, silent = true })
            -- vim.api.nvim_set_keymap('n', '<leader>mp', "<cmd>lua require('marks').prev_mark()<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>mf', ":Telescope marks <CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>mt', ":MarksToggleSigns <CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>ma', ":MarksListAll <CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>mb', ":MarksListBuf <CR>", { noremap = true, silent = true })
        end
    }
}
