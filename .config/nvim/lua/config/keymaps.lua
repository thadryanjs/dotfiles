---- [ Convenience Function ]

-- functions to save some typing/ease readability
-- ( https://vi.stackexchange.com/questions/37187/how-can-i-port-nmap-map-and-imap-commands-to-lua-configuration
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end


-- PLEASE
imap("jj", "<Esc>")

-- save with ctrl+s
imap("<C-s>", "<cmd>:w!<cr><esc>")
nmap("<C-s>", "<cmd>:w!<cr><esc>")

nmap("j",  "gj")
nmap("k", "gk")
nmap("<Up>", "gk")
nmap("<Down>", "gj")
nmap("<C-c>", '"+y')
nmap("<C-v>", '"+p')


-- autocomplete accept on enter, no newline
imap('<CR>', 'v:lua.pumvisible() ? "<C-Y>" : "<CR>"')

-- home
nmap("<leader>wo", ":e /home/thadryan/Documents/Vault/workspaces-overview.md<CR>")

-- preview buffer (https://stackoverflow.com/questions/28808922/quickly-switch-to-the-last-edited-buffer)
nmap("<leader>pp", "<C-^>")

-- [ Buffer padding ]
nmap("<leader>lz", ":vs buffer | :vertical resize -120<cr>")

-- [ Jupyter Notebook script hotkeys]
-- insert and normal mode version
imap("<C-o>", "# %% [code]")
-- looks weird, but it makes sure the markdown cell is automatically closed,
-- first line is commented out, and is placed back automatically
imap("<A-m>", "# %% [markdown]<CR><Esc>O\n\n# %% [code]<Esc>2ki# ")
nmap("<leader>jc", "i# %% [code]")
nmap("<leader>jm", "O# %% [markdown]<CR><Esc>O\n\n# %% [code]<Esc>2ki# ")


-- remove all code tags
imap("<A-e>", ":%s/# %% \\[code\\]<CR>")
-- search for code tags
nmap("<A-f>", "/# %% \\[code\\]<CR>")


-- nmap("<leader>je", ":%s/# %% \\[code\\]<CR>")
nmap("<leader>jf", "/# %% \\[code\\]<CR>")

-- close all buffers except current
-- :w | %bd | e# | bd
nmap("<leader>ca", ":w | %bd | e# | bd#<CR>")

-- remove current quickfix entry under cursor (apparently impossible lol)

-- set no conceal
nmap("<leader>nc", ":setlocal conceallevel=0<CR>")

-- [ Quarto hotkeys ]
imap("<A-r>", "```{r}\n\n```")
imap("<A-y>", "```{python}\n\n```<esc>")
-- imap("<A-l>", "```{julia}\n\n```<esc>")

-- remove highlighting
nmap("<leader>hr", ":nohl<CR>")

-- cd to current file directory
nmap("<leader>cd", ":cd %:p:h<CR>")

-- telescope buffers
nmap("<leader>fb", "<cmd>Telescope buffers<CR>")
nmap("<leader>bp", "<cmd>bprevious<CR>")
nmap("<leader>bn", "<cmd>bnext<CR>")

-- pipe operator
imap("kk", "%>%")

-- wait what is this?
-- local keyset = vim.keymap.set
-- local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- function _G.check_back_space()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end
-- keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
imap('<CR>', 'v:lua.pumvisible() ? "<C-Y>" : "<CR>"')

-- Jump to next diagnostic (any type: error, warn, info, hint, spell)
nmap('<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nmap('<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- sane diagnostics
vim.api.nvim_create_user_command("DiagnosticsLight", function()
    vim.diagnostic.config {
        virtual_text = false,
        signs = false,
        underline = true,
    }
end, {})

-- heavy duty, once-in-a-while diagnostics
vim.api.nvim_create_user_command("DiagnosticsHeavy", function()
    vim.diagnostic.config {
        virtual_text = false,
        signs = true,
        underline = true,
    }
end, {})


