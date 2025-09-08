return {
    {
        "neovim/nvim-lspconfig",
        config = function()

            local lspconfig = require('lspconfig')
            local coq = require('coq')

            local words = {}
            for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
            	table.insert(words, word)
            end

            lspconfig.r_language_server.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))

            lspconfig.pyright.setup(coq.lsp_ensure_capabilities({
                autostart = false,
                settings = {
                    python = {
                        pythonPath = vim.fn.exepath("python3")
                    },
                },
            }))

            lspconfig.pyrefly.setup(coq.lsp_ensure_capabilities({
                autostart = true,
                settings = {
                    python = {
                        pythonPath = vim.fn.getcwd() .. "/.pixi/envs/default/bin/python"
                    },
                },
            }))

            -- https://www.reddit.com/r/neovim/comments/s24zvh/how_can_i_load_a_user_dictionary_into_ltexls/
            lspconfig.ltex.setup(coq.lsp_ensure_capabilities({
                autostart = false,
                settings = {
                    ltex = {
                        dictionary = {
                            ['en-US'] = words,
                        },
                    },
                }
            }))

            lspconfig.julials.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))

            lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))

            -- lspconfig.clangd.setup(coq.lsp_ensure_capabilities({
            --     autostart = false
            -- }))
        end
    }
}
