require "config.global"
require "config.keymaps"
require "config.lazy"
require "config.autocmds"

vim.cmd("colorscheme kanagawa-dragon")
vim.cmd("set scl=no")
-- need to make this run when opening just that file
vim.cmd("source /home/thadryan/.config/nvim/ftplugin/todo.vim")
