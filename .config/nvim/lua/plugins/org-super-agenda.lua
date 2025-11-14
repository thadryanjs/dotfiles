return {
  'hamidi-dev/org-super-agenda.nvim',
  enabled = false,
  lazy = true,
  cmd = "OrgSuperAgenda",
  dependencies = {
    'nvim-orgmode/orgmode', -- required
    { 'lukas-reineke/headlines.nvim', config = true }, -- optional nicety
  },
  config = function()
    require('org-super-agenda').setup({
      -- Match your org-agenda_files from orgmode config
      org_directories = {
        '~/WorkVault/Projects',
        '~/HomeVault/Projects',
      },

      todo_states = {
        {
          name = 'TODO',
          keymap = 'ot',
          color = '#54546d', -- matches your TODO fg color
          strike_through = false,
          fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' },
        },
        {
          name = 'BLOCKED',
          keymap = 'ob',
          color = '#ff9e3b', -- matches your BLOCKED fg color
          strike_through = false,
          fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' },
        },
        {
          name = 'DONE',
          keymap = 'od',
          color = '#50FA7B',
          strike_through = true,
          fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' },
        },
      },

      -- Agenda keymaps (unchanged from your original config)
      keymaps = {
        filter_reset      = 'oa',
        toggle_other      = 'oo',
        filter            = 'of',
        filter_fuzzy      = 'oz',
        filter_query      = 'oq',
        undo              = 'u',
        reschedule        = 'cs',
        set_deadline      = 'cd',
        cycle_todo        = 't',
        reload            = 'r',
        refile            = 'R',
        hide_item         = 'x',
        preview           = 'K',
        reset_hidden      = 'X',
        toggle_duplicates = 'D',
        cycle_view        = 'ov',
      },

      -- Window appearance
      window = {
        width = 0.8,
        height = 0.7,
        border = 'rounded',
        title = 'Org Super Agenda',
        title_pos = 'center',
        margin_left = 0,
        margin_right = 0,
        fullscreen_border = 'none',
      },

      -- Groups matching your logic with BLOCKED group & Unscheduled TODO filtering
      groups = {
        {
          name = '🗓️ Tomorrow',
          matcher = function(i)
            return i.scheduled and i.scheduled:days_from_today() == 1
          end,
        },
        {
          name = '📅 Today',
          matcher = function(i)
            return i.scheduled and i.scheduled:is_today()
          end,
          sort = { by = 'priority', order = 'desc' },
        },
        {
          name = '⭐ Important',
          matcher = function(i)
            return i.priority == 'A' and (i.deadline or i.scheduled)
          end,
          sort = { by = 'date_nearest', order = 'asc' },
        },
        {
          name = '⏳ Overdue',
          matcher = function(i)
            return i.todo_state ~= 'DONE' and
              ((i.deadline and i.deadline:is_past()) or (i.scheduled and i.scheduled:is_past()))
          end,
          sort = { by = 'date_nearest', order = 'asc' },
        },
        {
          name = '🚫 Blocked',
          matcher = function(i)
            return i.todo_state == 'BLOCKED'
          end,
        },
        {
          name = '☠️ Deadlines',
          matcher = function(i)
            return i.deadline and i.todo_state ~= 'DONE' and not i:has_tag('personal')
          end,
          sort = { by = 'deadline', order = 'asc' },
        },
        -- {
        --   name = '🏠 Personal',
        --   matcher = function(i)
        --     return i:has_tag('personal')
        --   end,
        -- },
        -- {
        --   name = '💼 Work',
        --   matcher = function(i)
        --     return i:has_tag('work')
        --   end,
        -- },
        -- {
        --   name = '📆 Upcoming',
        --   matcher = function(i)
        --     if i.todo_state == 'DONE' then
        --       return false
        --     end
        --     local days = require('org-super-agenda.config').get().upcoming_days or 10
        --     local d1 = i.deadline and i.deadline:days_from_today()
        --     local d2 = i.scheduled and i.scheduled:days_from_today()
        --     return (d1 and d1 >= 0 and d1 <= days) or (d2 and d2 >= 0 and d2 <= days)
        --   end,
        --   sort = { by = 'date_nearest', order = 'asc' },
        -- },
        {
          name = '📝 Unscheduled TODO',
          matcher = function(i)
            if i.todo_state ~= 'TODO' then
              return false
            end
            if i.scheduled == nil and i.deadline == nil then
              local exclude_tags = {
                articles = true,
                movies = true,
                music = true,
                recipes = true,
                books = true,
                books_related = true,
                podcasts = true,
                television = true,
                vonnegut = true,
                videos = true,
                saved = true,
                food = true,
              }
              for _, tag in ipairs(i.tags or {}) do
                if exclude_tags[tag] then
                  return false
                end
              end
              return true
            end
            return false
          end,
          sort = { by = 'priority', order = 'desc' },
        },
      },

      upcoming_days = 7, -- from your org_deadline_warning_days
      hide_empty_groups = true,
      keep_order = false,
      allow_duplicates = false,
      group_format = '* %s',
      other_group_name = 'Other',
      show_other_group = false,
      show_tags = true,
      show_filename = true,
      heading_max_length = 70,
      persist_hidden = false,
      view_mode = 'classic',
      classic = { heading_order = { 'filename', 'todo', 'priority', 'headline' }, short_date_labels = false, inline_dates = true },
      compact = { filename_min_width = 10, label_min_width = 12 },
      group_sort = { by = 'date_nearest', order = 'asc' },
      debug = false,
    })
  end,
}
