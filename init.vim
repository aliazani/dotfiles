"Turn on syntax highlighting.
syntax on

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set number          " show line numbers
set showcmd         " show command in bottom bar
set showmode        " show VIM mode
set cursorline      " highlight current line

set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" turn off search highlight by help of prressing
nnoremap <space> :nohlsearch<CR>

set foldenable          " enable folding
set foldlevelstart=1   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" space open/closes folds
nnoremap <leader>z za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

set wildmenu        " visual autocomplete for command menu
filetype indent on      " load filetype-specific indent files

" Encoding
set encoding=utf-8

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set mouse=a " Enable mouse usage (all modes)

" set colorcolumn=120

set backspace=indent,eol,start " To allow backspacing over everything in insert mode

filetype plugin on      " load filetype-specific indent files
" Resources:
" * https://dougblack.io/words/a-good-vimrc.html
" * https://www.linode.com/docs/tools-reference/tools/introduction-to-vim-customization/

" ================ jump to the last position when reopening a file ==================
if has("autocmd")
          au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ================ Persistent Undo ==================
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

" ================ Scrolling ========================

set scrolloff=4         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Plugins ======================

call plug#begin()
Plug 'ervandew/supertab' " Supertab
Plug 'SirVer/ultisnips' " Track the engine.
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:
Plug 'morhetz/gruvbox'	" Color Schemes
Plug 'vim-airline/vim-airline'	" Themes For Statusline 
Plug 'vim-airline/vim-airline-themes'	" Make Statusline Awesome
Plug 'Yggdroot/indentLine'	" Indent Show Lines
Plug 'tpope/vim-fugitive'	" Git Tool
Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
Plug 'scrooloose/nerdtree'	" File List
Plug 'ryanoasis/vim-devicons' " icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'scrooloose/syntastic'	" Syntax Checking
Plug 'kien/ctrlp.vim'	" Fuzzy Search Files
Plug 'tpope/vim-surround'   " Qouting And Paranthesing
Plug 'mattn/emmet-vim' " HTML And CSS Plugin
Plug 'ap/vim-css-color' " CSS color
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " prettier
Plug 'raimondi/delimitmate'     "Brackets auto compelete
Plug 'flazz/vim-colorschemes' " Color Scheme
Plug 'joshdick/onedark.vim' " Atom One Dark theme
Plug 'tpope/vim-commentary'    " Comment
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto compelete engine
" Initialize plugin system
call plug#end()

" morhetz/gruvbox
silent! colorscheme gruvbox
set background=dark

" vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" coc config
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-go',
  \ 'coc-highlight',
  \ 'coc-markdownlint',
  \ 'coc-omnisharp',
  \ 'coc-spell-checker',
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-cssmodules',
  \ 'coc-emmet',
  \ 'coc-phpls',
  \ 'coc-r-lsp',
  \ 'coc-rls',
  \ 'coc-rust-analyzer',
  \ 'coc-texlab',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-xml',
  \ 'coc-yaml'
  \ ]

" UltiSnips Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_c_checkers = ["g++"]

" preservim/nerdtree
autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Emmet config for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" Hidden easter egg ;)
" Display relative and absolute line numbers simultaneously in Vim
" https://www.vim.org/scripts/script.php?script_id=2351
" call RltvNmbr#RltvNmbrCtrl(1)

" ================ Customize mapping ======================

let mapleader = "\<Space>"

" Toggle paste mode mode with <Leader>pp
nnoremap <Leader>pp :set paste!<CR>

" Indent whole file while preserving cursor location with <Leader>=
nnoremap <Leader>= m'gg=G`'

" Add a semicolon to the current line without moving the cursor with <Leader>;
nnoremap <Leader>; m'A;<ESC>`'

" Source vimrc with <Leader>vc
nnoremap <Leader>vc :source ~/.config/nvim/init.vim<CR>:echo "Reloaded .vimrc"<CR>

" Clear trailing whitespace with <Leader>cw
nnoremap <Leader>cw :%s/\s\+$//g<CR>:nohlsearch<CR>

" Nerdtree mappings. nt = toggle, nf = find.
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" Select All and Copy to system's clipboard (requires vim-gtk package on Ubuntu-Gnome)
nnoremap <leader>sa <esc>mzgg0vG$"+y'z<CR>

" Python runner
map <F5> :terminal python3 %<cr>
map <leader><F5> :q<cr>

" Comment a line with <ctrl>\
map <C-\> :Commentary<cr>

" ycm-core/YouCompleteMe
" " Python config
" " let g:ycm_python_binary_path = 'python3'
" " map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" " make YCM compatible with UltiSnips (using supertab)
" " let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" " let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" " let g:SuperTabDefaultCompletionType = '<C-y>'
