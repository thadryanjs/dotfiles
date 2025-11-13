return {
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            require('orgmode').setup({
                org_default_notes_file = '~/WorkVault/refile.org',

                -- Agenda
                org_agenda_files = {
                    '~/WorkVault/Projects/**/*.org',
                    '~/HomeVault/Projects/**/*.org',
                },
                org_agenda_custom_commands = {
                    u = {
                        description = "Unscheduled TODO tasks",
                        types = {
                            {
                                type = "tags",
                                match = "TODO=\"TODO\"|TODO=\"NEXT\"|TODO=\"QUEUED\"",
                                org_agenda_todo_ignore_scheduled = "all",
                                org_agenda_overriding_header = "Unscheduled TODO tasks",
                            },
                        }
                    }
                },
                -- Tasks

                org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
                org_todo_keyword_faces = {
                    -- WAITING = ':foreground blue :weight bold',
                    -- DELEGATED = ':background #FFFFFF :slant italic :underline on',
                    TODO = ':background #000000 :foreground #54546d', -- overrides builtin color for `TODO` keyword
                },

            })
            -- to mess with the colors: after orgmode setup, apply highlight overrides
            vim.api.nvim_create_autocmd('ColorScheme', {
                pattern = '*',
                callback = function()
                    vim.api.nvim_set_hl(0, '@org.priority.highest', { fg = '#AAFFAA', bold = true })
                    -- vim.api.nvim_set_hl(0, '@org.priority.high', { fg = '#FFFF00', bold = true })
                    -- vim.api.nvim_set_hl(0, '@org.priority.default', { fg = '#FFFFFF' })
                    -- vim.api.nvim_set_hl(0, '@org.priority.low', { fg = '#AAAAAA', italic = true })
                    -- vim.api.nvim_set_hl(0, '@org.priority.lowest', { fg = '#777777' })
                end,
            })
            -- FloatBorder    xxx guifg=#54546d guibg=#0d0c0c (nice dark purple)
            -- DiagnosticHint xxx guifg=#6a9589 (nice warm teal-ish)
            vim.api.nvim_set_hl(0, '@org.priority.highest', { fg = '#6a9589', bold = false})
            -- vim.api.nvim_set_hl(0, '@org.priority.high', { fg = '#FFFF00', bold = true })
            -- vim.api.nvim_set_hl(0, '@org.priority.default', { fg = '#FFFFFF' })
            -- vim.api.nvim_set_hl(0, '@org.priority.low', { fg = '#AAAAAA', italic = true })
            -- vim.api.nvim_set_hl(0, '@org.priority.lowest', { fg = '#777777' })

            -- misc
            local todo_template = [[
*** TODO Task name [#B]
    scheduled: <yyyy-mm-dd>
    :PROPERTIES:
        :Status: Queued
        :Note: Lorem Ipsum
    :END:
    - [ ] Subtasks
]]
            -- @org.priority.highest
            _G.insert_todo_template = function()
                local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
                local lines = vim.split(todo_template, "\n", { plain = true })
                vim.api.nvim_buf_set_lines(0, row, row, false, lines)
            end

            vim.keymap.set('n', '<leader>td', _G.insert_todo_template, { noremap = true, silent = true })
            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
                --   ensure_installed = 'all',
                --   ignore_install = { 'org' },
                -- })
            end,
        }
    }
