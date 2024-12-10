return {
    {
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
        }
        end,
    },
}
