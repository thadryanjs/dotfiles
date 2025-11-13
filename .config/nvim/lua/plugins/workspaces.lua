return {
    {
        "natecraddock/workspaces.nvim",
        config = function()
            require("workspaces").setup({
                path = "/home/thadryan/.workspaces.txt"
            })

        vim.api.nvim_set_keymap("n", "<leader>wf", ":Telescope workspaces<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>wv", ":e /home/thadryan/Documents/Vault/index.md<CR>",
                { noremap = true, silent = true })
        local function open_orgfile()
          local cwd = vim.fn.getcwd()
          local dirname = vim.fn.fnamemodify(cwd, ':t')
          local orgfile = cwd .. '/' .. dirname .. '.org'
          if vim.fn.filereadable(orgfile) == 1 then
            vim.cmd('edit ' .. orgfile)
          else
            print('Org file not found: ' .. orgfile)
          end
        end

        vim.api.nvim_set_keymap('n', '<leader>wi', '', {
          noremap = true,
          silent = true,
          callback = open_orgfile,
        })
        -- vim.api.nvim_set_keymap("n", "<leader>wi", ":e *.org<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>wq", ":e queue.md<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>wa", ":WorkspacesAdd<CR>", { noremap = true, silent = true })

        end
    }
}
