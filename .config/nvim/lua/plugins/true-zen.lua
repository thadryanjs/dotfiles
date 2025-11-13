return {
    {
        "loqusion/true-zen.nvim",
        enabled = false,
        config = function()
            require("true-zen").setup({
                modes = {
                    ataraxis = {
                        quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
                        minimum_writing_area = { -- minimum size of main window
                            width = 0,
                            height = 200,
                        },
                        padding = { -- padding windows
                            left = 8,
                            right = 0,
                            top = 0,
                            bottom = 0,
                        },
                    }
                },
                integrations = {
                    tmux = true, -- enable tmux integration
                }
            })

            vim.keymap.set('n', '<leader>zm', ":TZAtaraxis <CR> | :set relativenumber<CR>",
                { noremap = true, silent = true })
        end
    }
}






























-- return {
--     {
--         "loqusion/true-zen.nvim",
--         config = function()
--             opts = {
--                 modes = { -- configurations per mode
--                     ataraxis = {
--                         quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
--                         minimum_writing_area = { -- minimum size of main window
--                             width = 200,
--                             height = 200,
--                         },
--                         padding = { -- padding windows
-- 				            left = 10,
-- 				            right = 10,
-- 				            top = 10,
-- 				            bottom = 10,
--         			        },
--                     }
--                 }
--             },
--
--             -- Keybindings
--             vim.keymap.set('n', '<leader>za', ":TZAtaraxis <CR> | :set relativenumber<CR>",
--                 { noremap = true, silent = true })
--
--
--
--         end
--     }
-- }
