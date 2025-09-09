
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
vim.o.timeoutlen = 30000  -- Increase timeout length to 30 seconds
-- vim.opt.signcolumn = "yes"im.o.scl = "no"
-- translating "set formatoptions-=r"
-- doesn't work: https://www.reddit.com/r/neovim/comments/11ij7t4/how_to_set_formatoptionso_in_lua/
--vim.opt.formatoptions:remove({ 'o' })
-- vim.cmd(":set formatoptions-=r")

-- [ Folds ]j
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.custom_fold_expr(v:lnum)' -- Custom fold expression function
vim.opt.foldlevelstart=20

function _G.custom_fold_expr(lnum)
  local line = vim.fn.getline(lnum)
  if line:match('^# %%') then
    return '>1' -- Start a new fold level
  elseif line:match('^$') then
    return '=' -- Keep previous fold level for empty lines
  end
  return '1' -- Default fold level
end
-- vim.opt.foldmethod = "manual"

-- vim.opt.foldmethod = "indent"

-- this gives me an error saying this can't be a number but the docs say it has to be
-- a number https://neovim.io/doc/user/fold.html#_foldcolumn
-- it works when I set it manually in the while running
-- works with quotes but works with ints in live nvim lol
vim.opt.foldcolumn = "auto"


-- smarter search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true


-- [ LSP/Diagnostic settings ]
vim.o.updatetime = 500

-- how lsp diagnostics are displayed
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = false,
}

-- code folding is evil
-- vim.opt.foldenable = false

-- filetype
vim.cmd [[ filetype plugin on ]]


-- show hover instead of inline lsp diagnostics (absuredly based)
-- https://stackoverflow.com/questions/69290794/nvim-lsp-change-lspconfig-diagnostic-message-location
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- python provider
vim.g.python3_host_prog = '/usr/bin/python3'
