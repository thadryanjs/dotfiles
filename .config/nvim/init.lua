require "config.global"
require "config.keymaps"
require "config.lazy"
require "config.autocmds"

vim.cmd("colorscheme kanagawa-dragon")

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
