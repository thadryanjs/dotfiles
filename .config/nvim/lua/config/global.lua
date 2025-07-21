
--- [ Global Vim Settings ]

-- set dev path for lazy

-- space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- some basic things and options from (https://github.com/jmbuhr/quarto-nvim-kickstarter)
-- use spaces as tabs
local tabsize = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize
vim.opt.autochdir = false
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
-- enable mouse
vim.opt.mouse = 'a'
vim.opt.mousefocus = true
-- use system clipboard
vim.opt.clipboard:append 'unnamedplus'
--- don't hide characters (had this as autocommand too leaving for reference)
vim.opt.conceallevel = 0
-- also no signcolumn
-- vim.opt.signcolumn = 'no'
-- vim.opt.statuscolumn = 'no'
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 5
vim.opt.spell = false
vim.opt.spelllang = 'en_us'
vim.opt.spellsuggest = {'fast', 20}  -- Don't show too many suggestions for spell check
vim.opt.spellfile = vim.fn.expand("~/.config/nvim/spell/en.utf-8.add")
-- vim.opt.signcolumn = "yes"im.o.scl = "no"
-- translating "set formatoptions-=r"
-- doesn't work: https://www.reddit.com/r/neovim/comments/11ij7t4/how_to_set_formatoptionso_in_lua/
--vim.opt.formatoptions:remove({ 'o' })
-- vim.cmd(":set formatoptions-=r")

-- smarter search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true


-- [ LSP/Diagnostic settings ]
vim.o.updatetime = 500

-- how lsp diagnostics are displayed
--
-- making these toggleable would be nice
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
}

-- code folding is evil
vim.opt.foldenable = false

-- filetype
vim.cmd [[ filetype plugin on ]]


-- show hover instead of inline lsp diagnostics (absuredly based)
-- https://stackoverflow.com/questions/69290794/nvim-lsp-change-lspconfig-diagnostic-message-location
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- python provider
vim.g.python3_host_prog = '/usr/bin/python3'

