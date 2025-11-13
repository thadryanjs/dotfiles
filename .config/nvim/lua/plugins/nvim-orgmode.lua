return {
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            require('orgmode').setup({
                org_default_notes_file = '~/WorkVault/Projects/refile.org',
                org_startup_folded = "showeverything",
                -- the craziest shit I ever did see
                org_adapt_indentation = false,
                win_split_mode = "float",
                -- win_border = "rounded",

                -- Agenda
                org_agenda_files = {
                    '~/WorkVault/Projects/**/*.org',
                    '~/HomeVault/Projects/**/*.org',
                },
                org_agenda_skip_scheduled_if_done = true,
                org_deadline_warning_days = 7,
                org_agenda_custom_commands = {
                    -- ignore to-be-read files
                    u = {
                        description = "Unscheduled TODO tasks (no home TBR tags)",
                        types = {
                            {
                                type = "tags",
                                match = "TODO=\"TODO\"|TODO=\"NEXT\"|TODO=\"QUEUED\"",
                                -- ignore stuff from tbr - works for now, excluding a particular file from a view would be better
                                org_agenda_tag_filter_preset = "-articles-movies-music-recipes-books-books_related-podcasts-television-vonnegut-videos-saved-food",
                                org_agenda_todo_ignore_scheduled = "all",
                                org_agenda_overriding_header = "Unscheduled TODO tasks",
                            },
                        }
                    },
                    U = {
                        description = "Unscheduled TODO tasks (including home TBR tags)",
                        types = {
                            {
                                type = "tags",
                                match = "TODO=\"TODO\"|TODO=\"NEXT\"|TODO=\"QUEUED\"",
                                org_agenda_todo_ignore_scheduled = "all",
                                org_agenda_overriding_header = "Unscheduled TODO tasks",
                            },
                        }
                    },
                    b = {
                        description = "Blocked",
                        types = {
                            {
                              type = "tags",
                              match = "TODO=\"BLOCKED\"",
                            },
                        }
                    }
                },

                -- Tasks
                org_capture_templates = {
                    t = {
                        description = 'Simple TODO',
                        template = '* TODO [#B] %?',
                    },
                    d = {
                      description = 'TODO with DEADLINE, SCHEDULED, Priority',
                      template = {
                        '* TODO [#B] %?',
                        '    DEADLINE: %t SCHEDULED: %t',
                      },
                    },
                    -- I don't want every to-be-read as a todo
                    b = {
                        description = 'Untracked to-be-read',
                        template = '* %?',
                    }
                },
                org_todo_keywords = {
                    'TODO',
                    -- 'WAITING',
                    -- '|',
                    'DONE',
                    'BLOCKED'
                },
                org_todo_keyword_faces = {
                    -- WAITING = ':foreground blue :weight bold',
                    -- DELEGATED = ':background #FFFFFF :slant italic :underline on',
                    TODO = ':background #000000 :foreground #54546d', -- overrides builtin color for `TODO` keyword
                    -- WarningMsg     xxx guifg=#ff9e3b
                    BLOCKED = ':background #000000 :foreground #ff9e3b', -- overrides builtin color for `TODO` keyword
                },

            })
            -- colors
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
            -- open main orgfile with name of dir
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

            -- refile hotkey
            vim.api.nvim_set_keymap('n', '<leader>wr', ':e ~/WorkVault/Projects/refile.org<CR>', {
              noremap = true,
              silent = true
            })

            -- insert date and scheduling templates

            -- simple date
            _G.insert_org_date = function()
              local date = os.date("<%Y-%m-%d>")  -- e.g. <2024-06-13>
              vim.api.nvim_put({date}, 'c', true, true)
            end

            vim.api.nvim_set_keymap(
              'n',
              '<leader>id',
              ':lua insert_org_date()<CR>',
              { noremap = true, silent = true }
            )

            _G.insert_todo_template = function()
                local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
                local lines = vim.split(todo_template, "\n", { plain = true })
                vim.api.nvim_buf_set_lines(0, row, row, false, lines)
            end

            vim.keymap.set('n', '<leader>td', _G.insert_todo_template, { noremap = true, silent = true })

            -- template date
            vim.api.nvim_set_keymap(
              'n',
              '<leader>id',
              ':lua insert_org_date()<CR>',
              { noremap = true, silent = true }
            )

            _G.insert_deadline_scheduled_today = function()
              local today = os.date("%Y-%m-%d")
              local line = string.format("DEADLINE: <%s> SCHEDULED: <%s>", today, today)
              vim.api.nvim_put({line}, 'c', true, true)
            end

            vim.api.nvim_set_keymap(
              'n',
              '<leader>is',
              ':lua insert_deadline_scheduled_today()<CR>',
              { noremap = true, silent = true }
            )

            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
                --   ensure_installed = 'all',
                --   ignore_install = { 'org' },
                -- })
            end,
        }
    }
