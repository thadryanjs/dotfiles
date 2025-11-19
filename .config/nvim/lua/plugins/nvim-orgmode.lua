return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
        require('orgmode').setup({
            org_default_notes_file = '~/WorkVault/refile.org',
            org_startup_folded = "showeverything",
            -- the craziest shit I ever did see
            org_adapt_indentation = false,
            -- vertical, horizontal, auto, float
            win_split_mode = "horizontal",
            -- win_border = "rounded",
            scheduled_reminder = false,
            deadline_reminder = false,
            -- [[ Agenda ]] --
            org_agenda_files = {
                '~/WorkVault/Projects/**/*.org',
                '~/WorkVault/Areas/Tech/Orgmode/Orgmode.org',
                '~/WorkVault/Areas/Tech/Vim/Vim.org',
                '~/WorkVault/Areas/Tech/Tmux/Tmux.org',
                '~/WorkVault/refile.org',
                '~/WorkVault/to-be-read.org',
                '~/HomeVault/Projects/**/*.org',
            },
            org_agenda_skip_scheduled_if_done = true,
            org_agenda_skip_deadline_if_done = true,
            --org_agenda_todo_ignore_scheduled = "future",
            org_deadline_warning_days = 0,
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
                        },
                    }
                },
                -- x = {
                    --   description = "Scheduled only",
                    --   types = {
                        --     {
                            --       type = "agenda",
                            --       match = "TODO=\"TODO\"|TODO=\"NEXT\"|TODO=\"QUEUED\"",
                            --       org_agenda_overriding_header = "Scheduled TODOs?",
                            --       org_agenda_todo_ignore_deadlines = "all",
                            --       org_agenda_span = "week",
                            --     },
                            --   }
                            -- },
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
                                description = "blocked",
                                types = {
                                    {
                                        type = "tags",
                                        match = "todo=\"blocked\"",
                                    },
                                }
                            },
                            c = {
                                description = 'Combined view', -- Description shown in the prompt for the shortcut
                                types = {
                                    { -- WIP
                                        -- filters by TODO states + tags, here tags can be blank
                                        type = 'tags_todo',
                                        match = 'TODO="ONGOING"',
                                        org_agenda_overriding_header = "Ongoing",
                                    },
                                    {-- Blocked
                                        type = 'tags_todo',
                                        match = 'TODO="BLOCKED"',
                                        org_agenda_overriding_header = "Blocked",
                                    },
                                    {-- Weekly
                                        type = 'agenda',
                                        match = '-TODO="BLOCKED"',
                                        org_agenda_overriding_header = 'The week',
                                        org_agenda_start_on_weekday = 1,
                                        org_agenda_remove_tags = false
                                    },
                                }
                            },
                        },

                        -- [[ Tasks ]] --
                        org_capture_templates = {
                            t = {
                                description = 'Simple TODO',
                                template = '** TODO [#B] %?',
                            },
                            s = {
                                description = 'TODO with SCHEDULED and Priority',
                                template = {
                                    '** TODO [#B] %?',
                                    '    SCHEDULED: %t',
                                },
                            },
                            d = {
                                description = 'TODO with DEADLINE, Priority',
                                template = {
                                    '** TODO [#B] %?',
                                    '    DEADLINE: %t',
                                },
                            },
                            -- these get filtered out by one of my agenda views
                            b = {
                                description = 'Home to-be-read',
                                template = '** TODO [#B]* %?',
                            }
                        },
                        org_todo_keywords = {
                            'TODO',
                            'ONGOING',
                            'BLOCKED',
                            '|',
                            'DONE'
                        },
                        org_todo_keyword_faces = {
                            -- WAITING = ':foreground blue :weight bold',
                            -- DELEGATED = ':background #FFFFFF :slant italic :underline on',
                            TODO = ':background #000000 :foreground #54546d', -- overrides builtin color for `TODO` keyword
                            -- Title          xxx cterm=bold gui=bold guifg=#8ba4b0
                            ONGOING= ':background #000000 :foreground #8ba4b0', -- overrides builtin color for `TODO` keyword
                            -- WarningMsg     xxx guifg=#ff9e3b
                            BLOCKED = ':background #000000 :foreground #ff9e3b', -- overrides builtin color for `TODO` keyword
                        },

                    })

                    -- [[ Colors ]] --
                    -- to mess with the colors: after orgmode setup, apply highlight overrides
                    -- vim.api.nvim_create_autocmd('ColorScheme', {
                        --     pattern = '*',
                        --     callback = function()
                            --         -- Cursor         xxx guifg=#181616 guibg=#c5c9c5
                            --         vim.api.nvim_set_hl(0, '@org.priority.highest', { fg = '#AAFFAA', bold = true })
                            --         -- vim.api.nvim_set_hl(0, '@org.priority.high', { fg = '#FFFF00', bold = true })
                            --         -- vim.api.nvim_set_hl(0, '@org.priority.default', { fg = '#FFFFFF' })
                            --         -- vim.api.nvim_set_hl(0, '@org.priority.low', { fg = '#AAAAAA', italic = true })
                            --         -- vim.api.nvim_set_hl(0, '@org.priority.lowest', { fg = '#777777' })
                            --     end,
                            -- })
                            -- FloatBorder    xxx guifg=#54546d guibg=#0d0c0c (nice dark purple)
                            -- DiagnosticHint xxx guifg=#6a9589 (nice warm teal-ish)
                            vim.api.nvim_set_hl(0, '@org.priority.highest', { fg = '#6a9589', bold = false})
                            -- vim.api.nvim_set_hl(0, '@org.priority.high', { fg = '#FFFF00', bold = true })
                            -- vim.api.nvim_set_hl(0, '@org.priority.default', { fg = '#FFFFFF' })
                            -- vim.api.nvim_set_hl(0, '@org.priority.low', { fg = '#AAAAAA', italic = true })
                            -- vim.api.nvim_set_hl(0, '@org.priority.lowest', { fg = '#777777' })


                            -- [[ date manipulation ]] --
                            local function next_date_day()
                                local pattern = [[<\d\{4}-\d\{2}-\d\{2}]]
                                local save_pos = vim.fn.getpos('.')

                                local found = vim.fn.search(pattern, 'W')
                                if found ~= 0 then
                                    local curpos = vim.api.nvim_win_get_cursor(0) -- {line, col}
                                    local line = curpos[1]
                                    local col = curpos[2]
                                    -- Move to the day digits (9 chars after '<')
                                    local target_col = col + 9
                                    vim.api.nvim_win_set_cursor(0, {line, target_col})
                                else
                                    vim.fn.setpos('.', save_pos)
                                    print("No next date found")
                                end
                            end

                            vim.keymap.set('n', '<leader>nd', next_date_day, { desc = "Jump to next date's day digits" })
                            -- insert simple date
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
                            -- insert date and scheduling templates
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
                            -- Global function to move overdue DEADLINEs to today in current buffer,
                            -- but skip lines that already have a CLOSED: date
                            function _G.move_overdue_deadlines_to_today()
                                local today_str = os.date("%Y-%m-%d")
                                local today_weekday = os.date("%a")

                                local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                                local changed = false

                                for i, line in ipairs(lines) do
                                    -- Skip line if it contains CLOSED: date
                                    if not line:match("CLOSED:%s*<%d%d%d%d%-%d%d%-%d%d") then
                                        local date_str = line:match("DEADLINE:%s*<(%d%d%d%d%-%d%d%-%d%d)[^>]*>")

                                        if date_str then
                                            local y,m,d = date_str:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
                                            local deadline_time = os.time{year=tonumber(y), month=tonumber(m), day=tonumber(d)}
                                            local today_time = os.time{year=tonumber(os.date("%Y")), month=tonumber(os.date("%m")), day=tonumber(os.date("%d"))}

                                            if deadline_time < today_time then
                                                local replacement = string.format("DEADLINE: <%s %s>", today_str, today_weekday)
                                                local start_pos, end_pos = line:find("DEADLINE:%s*<[^>]->")
                                                if start_pos and end_pos then
                                                    lines[i] = line:sub(1, start_pos - 1) .. replacement .. line:sub(end_pos + 1)
                                                    changed = true
                                                end
                                            end
                                        end
                                    end
                                end

                                if changed then
                                    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
                                    print("Overdue deadlines moved to today")
                                else
                                    print("No overdue deadlines found or all with CLOSED:")
                                end
                            end

                            -- Optional: keymap for normal mode (leader + od)
                            vim.keymap.set('n', '<leader>od', _G.move_overdue_deadlines_to_today, {desc = "Move overdue DEADLINEs to today"})           -- Global function to move overdue DEADLINEs to today in current buffer

                            -- Optional: create a user command to call the function
                            vim.api.nvim_create_user_command('MoveOverdueDeadlines', function()
                                _G.move_overdue_deadlines_to_today()
                            end, {})

                            -- Optional: keymap for normal mode (leader + od)
                            vim.keymap.set('n', '<leader>od', _G.move_overdue_deadlines_to_today, {desc = "Move overdue DEADLINEs to today"})
                            -- Global function to remove weekday names inside <YYYY-MM-DD ...> in visual selection
                            function _G.remove_weekdays_in_dates()
                                local bufnr = vim.api.nvim_get_current_buf()
                                -- Get visual selection marks
                                local start_line = vim.api.nvim_buf_get_mark(bufnr, "<")[1]
                                local end_line = vim.api.nvim_buf_get_mark(bufnr, ">")[1]
                                if start_line > end_line then
                                    start_line, end_line = end_line, start_line
                                end

                                -- Get lines in the visual selection
                                local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)

                                -- Pattern matching <YYYY-MM-DD Weekday>
                                -- Capture the date part and closing '>', drop the weekday (sequence of letters)
                                local pattern = "(<%d%d%d%d%-%d%d%-%d%d) [%a]+(>)"

                                for i, line in ipairs(lines) do
                                    lines[i] = line:gsub(pattern, "%1%2")
                                end

                                -- Replace the lines in the buffer
                                vim.api.nvim_buf_set_lines(bufnr, start_line - 1, end_line, false, lines)
                            end

                            -- Visual mode mapping to run the function, replace <leader>rw to your preference
                            vim.api.nvim_set_keymap('v', '<leader>rw', ':lua _G.remove_weekdays_in_dates()<CR>', { noremap = true, silent = true })

                            -- recurring task template
                            function _G.insert_recurring_tasks()
                                local input = vim.fn.input("Task name: ")
                                if input == "" then
                                    print("Task name cannot be empty")
                                    return
                                end
                                local bufnr = vim.api.nvim_get_current_buf()
                                local start_line = vim.api.nvim_win_get_cursor(0)[1] -- current line to insert below

                                local os_date = os.date
                                local os_time = os.time
                                local fmt = "<%Y-%m-%d %a +1w>"

                                local lines = {}

                                -- Insert 5 days starting today, scheduled with +1w recurrence
                                for i = 0, 4 do
                                    local day_time = os_time() + (i * 24 * 60 * 60)
                                    local sched_date = os_date(fmt, day_time)
                                    table.insert(lines, string.format("** TODO [#B] %s", input))
                                    table.insert(lines, string.format("  SCHEDULED: %s", sched_date))
                                end

                                -- Insert lines below current cursor line
                                vim.api.nvim_buf_set_lines(bufnr, start_line, start_line, false, lines)

                                print("Inserted recurring tasks for 5 days")
                            end

                            -- Map <leader>ir to call the function
                            vim.api.nvim_set_keymap('n', '<leader>ir', ':lua _G.insert_recurring_tasks()<CR>', {
                                noremap = true,
                                silent = true,
                            })

                            -- [[ Misc ]] --
                            -- shortcuts to open key files quickly
                            vim.api.nvim_set_keymap('n', '<leader>wi', ':e index.md<CR>', {})
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

                            vim.api.nvim_set_keymap('n', '<leader>wo', '', {
                                noremap = true,
                                silent = true,
                                callback = open_orgfile,
                            })

                            -- refile hotkey
                            vim.api.nvim_set_keymap('n', '<leader>wr', ':e ~/WorkVault/refile.org<CR>', {
                                noremap = true,
                                silent = true
                            })

                        end,
                    }
