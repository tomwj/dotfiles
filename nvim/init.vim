" Minimal Configuration
set nocompatible
syntax on
filetype plugin indent on
" Configuration for Neovim
"
" PLUGINS
" =======
" Specify a directory for plugins (for Neovim: )
call plug#begin('~/.local/share/nvim/plugged')
" Allows diffing of lines in file. 
Plug 'AndrewRadev/linediff.vim'
" Easy way to add formatters
Plug 'sbdchd/neoformat'
Plug 'junegunn/vim-easy-align'
" Syntax highlight and much goodness
Plug 'vim-syntastic/syntastic'
" Ack Search in vim
Plug 'mileszs/ack.vim'
" Insert and delete brackets etc in pairs
Plug 'jiangmiao/auto-pairs'
" Autoindent Groovy
Plug 'vim-scripts/groovyindent-unix'
" Fuzzy finder files, buffers, tags :CtrlP
Plug 'ctrlpvim/ctrlp.vim'
" Mean, lean, status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colour scheme
Plug 'freeo/vim-kalisi'
" editorconfig, change settings based on .editorconfig
Plug 'editorconfig/editorconfig-vim'
" Show thin verticle line for indentation level
Plug 'Yggdroot/indentLine'
" Handy git integrations
Plug 'tpope/vim-fugitive'
" Enables commenting blocks of code gcc gc
Plug 'tpope/vim-commentary'
" Adds lots of shortcuts like ]q [q for cnext and cprevious
Plug 'tpope/vim-unimpaired'
" Surround terms with etc 
Plug 'tpope/vim-surround'
" Surround terms with etc 
Plug 'tpope/vim-repeat'
" Shows little plus minus in gutter for git
Plug 'airblade/vim-gitgutter'
" stackanswers
Plug 'james9909/stackanswers.vim'
" NERDTree, side bar file tree
Plug 'scrooloose/nerdtree'
" Grrr AWS completions
Plug 'm-kat/aws-vim'
"" Code snippet completion
"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
" Super Tab tab all the things
Plug 'ervandew/supertab'
" Cheatsheat for vim in vim
Plug 'lifepillar/vim-cheat40'
" ansible highlighting
Plug 'pearofducks/ansible-vim'
" Wrapper for cscope
Plug 'mfulz/cscope.nvim'
" Enable fzf in vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Install terraform for vim
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
" Align Github flavoured markdown tables
Plug 'junegunn/vim-easy-align'
" Javascript autocomplete
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
" Linting
"Plug 'neomake/neomake', { 'on': 'Neomake' }
call plug#end()

" Map ctrl n to open filetree
map <C-n> :NERDTreeToggle<CR>

" open new file from ctrl+p in pane
let g:ctrlp_switch_buffer = 'et'
" dont limit the files ctrl+p can search
let g:ctrlp_max_files=50000
" ignore .gitignored files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ansible_unindent_after_newline = 1

" COLOURSCHEME
" ============
set t_Co=256
set number
" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" Mean lean status line
let g:vim_airline_theme='kalisi'
colorscheme kalisi
" set background=light
" or 
set background=dark
" if you don't set the background, the light theme will be used
let g:AWSVimValidate = 1 


" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_w = 1
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_yaml_checker_args = ["-d '{\"extends\": \"default\", \"rules\": {\"line-length\": {\"level\": \"warning\"}}}'"]
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_yaml_yamllint_exe = 'yamllint -d "{\"extends\": \"default\", \"rules\": {\"line-length\": {\"level\": \"warning\"}}}"'
let g:syntastic_javascript_eslint_exe = 'node_modules/.bin/eslint --config=.eslintrc.js --max-warnings=0'
let g:syntastic_python_checkers = ['pylint']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Path to store the cscope files (cscope.files and cscope.out)
" Defaults to '~/.cscope'
let g:cscope_dir = '~/.nvim-cscope'

" Map the default keys on startup
" These keys are prefixed by CTRL+\ <cscope param>
" A.e.: CTRL+\ d for goto definition of word under cursor
" Defaults to off
let g:cscope_map_keys = 1

" Update the cscope files on startup of cscope.
" Defaults to off
let g:cscope_update_on_start = 1

" Tabs GTFO
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Persistent Undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Don't hide quotes in json, or formatting in markdown
set conceallevel=0

function! TestCommitRevert()
  w
  silent !./TCR.sh
endfunction

command! W TestCommitRevert
