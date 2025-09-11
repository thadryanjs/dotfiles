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

            local util = require("lspconfig.util")
            local configs = require("lspconfig.configs")
            local data_path = vim.fn.stdpath("data")

            if not configs.pyrefly then
              configs.pyrefly = {
                default_config = {
                  cmd = { data_path .. "/mason/bin/pyrefly", "lsp" },
                  filetypes = { "python" },
                  root_dir = util.root_pattern(".git", "."),
                },
              }
            end

            -- a few bugs? (import, stackoverflow (weird?))
            lspconfig.pyrefly.setup(coq.lsp_ensure_capabilities({
                autostart = false,
                settings = {
                    python = {
                        pythonPath = vim.fn.getcwd() .. "/.pixi/envs/default/bin/python"
                    },
                },
            }))

           -- Ty loads WAY WAY WAY faster (I have diagnostics waiting for me when the file opens lol), updates almost instantly
           -- but doesn't recognize pixi (easy to ignore)
           -- https://github.com/astral-sh/ty/issues/265
           if not configs.ty then
             configs.ty = {
               default_config = {
                 cmd = { data_path .. "/mason/bin/ty", "server" },
                 filetypes = { "python" },
                 root_dir = util.root_pattern(".git", "."),
               },
             }
           end

           lspconfig.ty.setup(coq.lsp_ensure_capabilities({
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

            lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))

        end
    }
}
