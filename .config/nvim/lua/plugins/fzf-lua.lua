return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      require("fzf-lua").setup({})

      vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', {})
      -- vim.keymap.set('n', '<leader>fg', ':FzfLua grep<CR>', {})
      vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', {})
      vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', {})
      vim.keymap.set('n', '<leader>fb', ':FzfLua blines<CR>', {})
    end,
  },
}

-- Replace these telescope functions with fzf-lua
-- vim.keymap.set('n', '<leader>ff', ":Telescope find_files hidden=true no_ignore=true<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fr', ":Telescope oldfiles<cr>")
