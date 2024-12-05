require "config.global"
require "config.keymaps"
require "config.lazy"
require "config.autocmds"

vim.cmd("colorscheme kanagawa-dragon")
vim.cmd("set scl=no")
--vim.cmd("inoremap <expr> <CR> pumvisible() ? '\\<C-Y>' : '\\<CR>'")
