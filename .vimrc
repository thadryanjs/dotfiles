" largely based on this: (maybe not anymore)
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
" set number
" set relativenumber

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not let cursor scroll below or above N number of lines when scrolling.
"set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Undo config: https://vi.stackexchange.com/questions/6/how-can-i-use-the-undofile
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" back up config: https://stackoverflow.com/questions/25318875/how-to-configure-vim-backup-directories
set backup
if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir ~/.vim/backupdir"
endif
set backupdir=~/.vim/backupdir

" clipboard, if possible
set clipboard=unnamedplus

" normal backspace
set backspace=indent,eol,start

" no autocomment
set formatoptions-=cro

" change the cursor when the mode changes (this one works on my local machine)
" let &t_SI = "\<esc>[5 q"
" let &t_SR = "\<esc>[5 q"
" let &t_EI = "\<esc>[2 q"

" (this one works on discovery) or not
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

""" General mappings

let mapleader=" "

"inoremap <f8> <Esc>
imap jj <Esc>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
nnoremap q <c-v>

" don't freeze on ctrl s
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Yank to system clipboard with 'y'
nnoremap y "+y
vnoremap y "+y
" Yank a line to system clipboard
nnoremap Y "+y$
nnoremap yy "+yy

" save on ctrl s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" navigate visual lines not logical ones
nmap j gj
nmap k gk
nmap <Up> gk
nmap <Down> gj
nmap <C-c> "+y
nmap <C-v> "+p

" Navigate through buffers
nnoremap <leader>bn :bnext<CR>  " Move to the next buffer
nnoremap <leader>bp :bprevious<CR>  " Move to the previous buffer
nnoremap <leader>1 :b 1<CR>
nnoremap <leader>2 :b 2<CR>
nnoremap <leader>3 :b 3<CR>
nnoremap <leader>4 :b 4<CR>

" do nothing on ctrl z
nnoremap <c-z> <nop>

" open right split terminal
nnoremap <Leader>tr :rightb vert term<CR>

" not working right now
" dplyr pipe, modified from here: https://github.com/jalvesaq/Nvim-R/issues/85
autocmd FileType r inoremap <buffer> <A-p> <Esc>:normal! a %>%<CR>a
autocmd FileType rnoweb inoremap <buffer> <A-p> <Esc>:normal!a %>%<CR>a
autocmd FileType rmd inoremap <buffer> <A-p> <Esc>:normal! a %>%<CR>a
" }}}

" Jupyter bindings (no plugin)
nmap <Leader>jf /# %% \[code\]<CR>
nmap <Leader>jc i# %% [code]<CR>
nmap <Leader>jm O# %% [markdown]<CR><Esc>O<CR><CR># %% [code]<Esc>2ki#



""" Plugins

call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'
    Plug 'flazz/vim-colorschemes'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'jpalardy/vim-slime'
    Plug 'kana/vim-smartinput'
    Plug 'github/copilot.vim'
    Plug 'Shougo/deoplete.nvim'
    " Maybe?:
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'junegunn/fzf.vim'
    " Previous
    " Plug 'maxboisvert/vim-simple-complete'

call plug#end()


"" NERD file tree
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'r': { 'left': '# ' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
let g:NERDTreeWinSize=16

nnoremap <leader>n :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"" Slime
let g:slime_cell_delimiter = "# %%"
" minimal vim setup
let g:slime_target = "vimterminal"
" neovim/tmux set up
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}
nnoremap <Leader>ss :SlimeConfig<CR>
nnoremap <Leader>sc :call slime#send_cell()<CR>


""" Commands
" search buffer and put into quickfix list
" :bufdo vimgrepadd threading % | copen
"
" search project and put into quickfix list
" :vimgrep World **.* | copen
