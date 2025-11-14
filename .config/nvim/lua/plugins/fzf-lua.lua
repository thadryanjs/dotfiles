return {
  {
    "ibhagwan/fzf-lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      require("fzf-lua").setup({})

      vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', {})
      -- vim.keymap.set('n', '<leader>fg', ':FzfLua grep<CR>', {})
      vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', {})
      vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', {})
      -- searches the content of a buffer
      vim.keymap.set('n', '<leader>sb', ':FzfLua blines<CR>', {})
    end,
  },
}
