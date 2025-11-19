return {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = {
            {
                path = '~/WorkVault/',
                syntax = 'markdown',
                ext = '.md',
            },
            {
                path = '~/HomeVault/',
                syntax = 'markdown',
                ext = '.md',
            },
            -- {
                --     path = '~/HomeVault/Projects/RPGs/Newhale',
                --     syntax = 'markdown',
                --     ext = '.md',
                -- },
            }
        end,
        config = function()
            vim.keymap.set('n', '<leader>lc', ": VimwikiToggleListItem<CR>", {})
            vim.keymap.set('n', '<leader>la', 'i- [ ] ', {})
            vim.keymap.set('n', '<leader>lf', function()
                require('fzf-lua').live_grep {
                    search = "- [ ]",
                    prompt = "> TODOS (- [ ])> ",
                }
            end, { silent = true })
        end

    }

    -- vimwiki
    -- nmap("<leader>lc", ": VimwikiToggleListItem<CR>")
    -- imap("kk", "%>%")
