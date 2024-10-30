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
set number
set relativenumber

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

" set smart
filetype plugin indent on

" not statusline by default
set laststatus=0
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
nnoremap <Leader>tb :belowright term<CR>

nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
nnoremap <Leader>ts :vertical resize +20<CR>

" unhighlight
nnoremap <Leader>hr :nohlsearch<CR>

" Jupyter bindings (no plugin)
" nomal mode
nmap <Leader>jf /# %% \[code\]<CR>
nmap <Leader>jc i# %% [code]<CR>
" insert mode
inoremap <C-o> # %% [code]<CR>
" this on is weird but I don't use it that much
"inoremap <C-m> # %% [markdown]<CR><Esc>O<CR><CR># %% [code]<Esc>2ki#


" marks
nnoremap Q :<C-u>marks<CR>:normal! `

" Most autoclose functions insert when they shouldn't (adding a function the left hand side of text, ie foo()bar(x).
" Plug 'jiangmiao/auto-pairs' 
" Plug 'kana/vim-smartinput'
" Plug 'spf13/vim-autoclose'
" This one I am using doesn't, but breaks auto indent. This one plus lexima together work as I want. 

""" Plugins
call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'
    " Plug 'flazz/vim-colorschemes'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'jpalardy/vim-slime'
    Plug 'Townk/vim-autoclose'
    Plug 'cohama/lexima.vim' 
    Plug 'github/copilot.vim'
    Plug 'wellle/tmux-complete.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

" let g:AutoPairsFlyMode = 1


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
highlight link NERDTreeExecFile ModeMsg

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
nnoremap <Leader>ss :call slime#send_lines(v:count1)<CR>j
nnoremap <Leader>sc :call slime#send_cell()<CR>

" ALE
" nnoremap <Leader>a :set signcolumn=yes \| ALEHover<CR>
" start off by default
let g:ale_enabled = 0
nnoremap <Leader>ae :let g:ale_enabled = 1 \| ALEEnable \| set signcolumn=yes \| ALEHover<CR>
nnoremap <Leader>ad :let g:ale_enabled = 0 \| ALEDisable \| ALEStopAllLSPs \| :set signcolumn=no \| :edit<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>

"" Copilot
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")

"" zfz etz
nnoremap <Leader>ff :Files .<CR>
nnoremap <Leader>fg :Ag<CR>
nnoremap <Leader>fb :Buffers<CR>
" file history 
nnoremap <Leader>fr :History<CR>
" command history
nnoremap <Leader>fc :History:<CR>
" key mappings
nnoremap <Leader>fm :Maps<CR>



""" Colors
" I just let it use my terminal colors, but make a few tweaks
" colorscheme default
" " these complement 'Embers (base16)' from wezterm
" highlight Special ctermfg=cyan guifg=cyan
" " highlight Delimiter ctermfg=cyan guifg=cyan
" highlight Comment ctermfg=darkgrey guifg=darkgrey
" "highlight Search term=bold ctermfg=2 gui=bold guifg=SeaGreen
" highlight Operator term=bold ctermfg=4 guifg=Blue
" highlight Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
" highlight SignColumn ctermbg=none
" " the hover menu for autocomplete is too bright
" highlight Pmenu ctermbg=8 ctermfg=7

" I just let it use my terminal colors, but make a few tweaks
" colorscheme candle-grey 
" highlight Normal guibg=NONE ctermbg=NONE

" colorscheme photon
" highlight Normal guibg=NONE ctermbg=NONE guifg=#c0c0c0 ctermfg=250  
" highlight Search guifg=#262626 guibg=#008080 ctermfg=235 ctermbg=37
" highlight Normal guibg=NONE ctermbg=NONE
" highlight Comment guibg=NONE ctermbg=NONE
" highlight Constant guibg=NONE ctermbg=NONE
" highlight Identifier guibg=NONE ctermbg=NONE
" highlight Function guibg=NONE ctermbg=NONE
" highlight Statement guibg=NONE ctermbg=NONE
" highlight Type guibg=NONE ctermbg=NONE
" highlight Special guibg=NONE ctermbg=NONE
" highlight Keyword guibg=NONE ctermbg=NONE
" highlight Operator guibg=NONE ctermbg=NONE
" highlight PreProc guibg=NONE ctermbg=NONE
" highlight NonText guibg=NONE ctermbg=NONE
" highlight Title guibg=NONE ctermbg=NONE
" highlight MsgArea guibg=NONE ctermbg=NONE
" highlight ModeMsg guibg=NONE ctermbg=NONE
" highlight MoreMsg guibg=NONE ctermbg=NONE
" highlight Question guibg=NONE ctermbg=NONE

" set termguicolors
" set background=dark
" colorscheme zenbones
" highlight Normal guibg=NONE ctermbg=NONE
" highlight Constant term=underline ctermfg=13 guifg=#868C91
" highlight Constant term=underline cterm=none ctermfg=13 gui=none guifg=#868C91
" highlight Comment term=bold cterm=none ctermfg=14 gui=none guifg=#6E6763

" https://vimcolors.org
set termguicolors
hi clear
syntax reset
let g:colors_name = "blue-steel"
set background=dark
set t_Co=256
hi Normal guifg=#b4b4b4 ctermbg=NONE guibg=#272935 gui=NONE

hi DiffText guifg=#a0a0c2 guibg=NONE
hi ErrorMsg guifg=#a0a0c2 guibg=NONE
hi WarningMsg guifg=#a0a0c2 guibg=NONE
hi PreProc guifg=#a0a0c2 guibg=NONE
hi Exception guifg=#a0a0c2 guibg=NONE
hi Error guifg=#a0a0c2 guibg=NONE
hi DiffDelete guifg=#a0a0c2 guibg=NONE
hi GitGutterDelete guifg=#a0a0c2 guibg=NONE
hi GitGutterChangeDelete guifg=#a0a0c2 guibg=NONE
hi cssIdentifier guifg=#a0a0c2 guibg=NONE
hi cssImportant guifg=#a0a0c2 guibg=NONE
hi Type guifg=#a0a0c2 guibg=NONE
hi Identifier guifg=#a0a0c2 guibg=NONE
hi PMenuSel guifg=#bbb9b0 guibg=NONE
hi Constant guifg=#bbb9b0 guibg=NONE
hi Repeat guifg=#bbb9b0 guibg=NONE
hi DiffAdd guifg=#bbb9b0 guibg=NONE
hi GitGutterAdd guifg=#bbb9b0 guibg=NONE
hi cssIncludeKeyword guifg=#bbb9b0 guibg=NONE
hi Keyword guifg=#bbb9b0 guibg=NONE
hi IncSearch guifg=#778899 guibg=NONE
hi Title guifg=#778899 guibg=NONE
hi PreCondit guifg=#778899 guibg=NONE
hi Debug guifg=#778899 guibg=NONE
hi SpecialChar guifg=#778899 guibg=NONE
hi Conditional guifg=#778899 guibg=NONE
hi Todo guifg=#778899 guibg=NONE
hi Special guifg=#778899 guibg=NONE
hi Label guifg=#778899 guibg=NONE
hi Delimiter guifg=#778899 guibg=NONE
hi Number guifg=#778899 guibg=NONE
hi CursorLineNR guifg=#778899 guibg=NONE
hi Define guifg=#778899 guibg=NONE
hi MoreMsg guifg=#778899 guibg=NONE
hi Tag guifg=#778899 guibg=NONE
hi String guifg=#778899 guibg=NONE
hi MatchParen guifg=#778899 guibg=NONE
hi Macro guifg=#778899 guibg=NONE
hi DiffChange guifg=#778899 guibg=NONE
hi GitGutterChange guifg=#778899 guibg=NONE
hi cssColor guifg=#778899 guibg=NONE
hi Function guifg=#d1d9e5 guibg=NONE
hi Directory guifg=#646476 guibg=NONE
hi markdownLinkText guifg=#646476 guibg=NONE
hi javaScriptBoolean guifg=#646476 guibg=NONE
hi Include guifg=#646476 guibg=NONE
hi Storage guifg=#646476 guibg=NONE
hi cssClassName guifg=#646476 guibg=NONE
hi cssClassNameDot guifg=#646476 guibg=NONE
hi Statement guifg=#3a6f9f guibg=NONE
hi Operator guifg=#3a6f9f guibg=NONE
hi cssAttr guifg=#3a6f9f guibg=NONE


hi Pmenu guifg=#b4b4b4 guibg=#454545
hi SignColumn guibg=#272935
hi Title guifg=#b4b4b4
hi LineNr guifg=#747474 guibg=#272935
hi NonText guifg=#6c6b70 guibg=#272935
hi Comment guifg=#6c6b70 gui=italic
hi SpecialComment guifg=#6c6b70 gui=italic guibg=NONE
hi CursorLine guibg=#454545
hi TabLineFill gui=NONE guibg=#454545
hi TabLine guifg=#747474 guibg=#454545 gui=NONE
hi StatusLine gui=bold guibg=#454545 guifg=#b4b4b4
hi StatusLineNC gui=NONE guibg=#272935 guifg=#b4b4b4
hi Search guibg=#6c6b70 guifg=#b4b4b4
hi VertSplit gui=NONE guifg=#454545 guibg=NONE
hi Visual gui=NONE guibg=#454545
hi MatchParen cterm=bold ctermbg=14 guibg=#008080

" Clear background for other relevant groups
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight Title guibg=NONE ctermbg=NONE
highlight MsgArea guibg=NONE ctermbg=NONE
highlight ModeMsg guibg=NONE ctermbg=NONE
highlight MoreMsg guibg=NONE ctermbg=NONE
highlight Question guibg=NONE ctermbg=NONE


""" autocommands
" don't include terminals as buffer for next/prev
" https://www.reddit.com/r/vim/comments/8njgul/is_it_possible_to_skip_over_terminal_buffers_when/
autocmd TerminalOpen * setlocal nobuflisted

autocmd FileType r inoremap <buffer> kk <C-O>:normal! a%>% <CR>
autocmd FileType rnoweb inoremap <buffer> kk <C-O>:normal! a%>% <CR>
autocmd FileType rmd inoremap <buffer> kk <C-O>:normal! a%>% <CR>
autocmd FileType r setlocal expandtab autoindent shiftwidth=2 softtabstop=2 tabstop=2


""" Vimscript
" Thank you chat GTP - will f up your metadeta in jupyter notebooks as code
function! MoveTrailingCommentsUp()
    " Loop through all lines in the buffer
    let l:line_count = line('$')
    for l:num in range(1, l:line_count)
        let l:line = getline(l:num)
        " Check if the line contains a comment
        if l:line =~ '#'
            " Split the line into code and comment parts
            let l:parts = split(l:line, '#', 2)
            " Get the code and comment
            let l:code = l:parts[0]
            let l:comment = trim(l:parts[1])
            " If there's a comment, move it above
            if !empty(l:comment)
                " Capture the indentation of the code
                let l:indent = matchstr(l:line, '^\s*')
                " Set the current line to only the code
                call setline(l:num, l:code)
                " Insert the comment above with matching indentation
                call append(l:num - 1, l:indent . '# ' . l:comment)
            endif
        endif
    endfor
endfunction

" Command to call the function
command! MoveComments call MoveComments()


""" Commands
" search buffer and put into quickfix list
" :bufdo vimgrepadd threading % | copen
"
" search project and put into quickfix list
" :vimgrep World **.* | copen
